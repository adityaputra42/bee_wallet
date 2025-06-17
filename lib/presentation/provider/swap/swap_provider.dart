// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web3dart/web3dart.dart';

import '../../../config/config.dart';
import '../../../data/model/model.dart';
import '../../../data/model/token_chain/selected_token_chain.dart';
import '../../../utils/blockchain_helper/swap/evm_swap.dart';
import '../../../utils/util.dart';
import '../account/account_provider.dart';
import '../provider.dart';
part 'swap_provider.g.dart';

@riverpod
class ChainSwapFrom extends _$ChainSwapFrom {
  @override
  SelectedTokenChain build() {
    return SelectedTokenChain();
  }

  setChain(SelectedTokenChain chain) {
    final tokenTo = ref.read(chainSwapToProvider);
    final originChain = ref.watch(listOriginChainSwapProvider);
    final tokenA = chain.contractAddress ?? chain.wrapedAddress;
    final tokenB = tokenTo.contractAddress ?? tokenTo.wrapedAddress;

    var selectedOrigin = originChain.singleWhere(
      (v) => v.chainId == chain.chainId,
      orElse: () => TokenChain(),
    );
    if (tokenA == null || tokenA.isEmpty || tokenB == null || tokenB.isEmpty) {
      log('Gagal mendapatkan address untuk pair: tokenA or tokenB null/empty');
      ref.read(swapOriginChainProvider.notifier).setChain(selectedOrigin);
      state = chain;
      return;
    }

    // if (tokenTo.chainId != null && tokenTo.chainId == chain.chainId) {
    //   ref
    //       .read(pairAddressProvider.notifier)
    //       .getPair(tokenA: chain, tokenB: tokenTo);
    // }
    if (tokenTo.chainId != null) {
      if (tokenTo.chainId != chain.chainId) {
        //   ref
        //       .read(pairAddressProvider.notifier)
        //       .getPair(tokenA: tokenTo, tokenB: chain);
        // } else {
        ref.read(swapOriginChainProvider.notifier).setChain(selectedOrigin);
        ref.read(chainSwapToProvider.notifier).setChain(SelectedTokenChain());
      }
    } else {
      ref.read(swapOriginChainProvider.notifier).setChain(selectedOrigin);
    }

    state = chain;
    ref.read(disableSwapProvider.notifier).validate();
  }
}

@riverpod
class ChainSwapTo extends _$ChainSwapTo {
  @override
  SelectedTokenChain build() {
    return SelectedTokenChain();
  }

  setChain(SelectedTokenChain chain) {
    final tokenFrom = ref.read(chainSwapFromProvider);
    final originChain = ref.watch(listOriginChainSwapProvider);

    final tokenA = tokenFrom.contractAddress ?? tokenFrom.wrapedAddress;
    final tokenB = chain.contractAddress ?? chain.wrapedAddress;

    var selectedOrigin = originChain.singleWhere(
      (v) => v.chainId == chain.chainId,
      orElse: () => TokenChain(),
    );
    if (tokenA == null || tokenA.isEmpty || tokenB == null || tokenB.isEmpty) {
      log('Gagal mendapatkan address untuk pair: tokenA or tokenB null/empty');

      ref.read(swapOriginChainProvider.notifier).setChain(selectedOrigin);
      state = chain;
      return;
    }

    if (tokenFrom.chainId != null) {
      if (tokenFrom.chainId != chain.chainId) {
        //   ref
        //       .read(pairAddressProvider.notifier)
        //       .getPair(tokenA: tokenFrom, tokenB: chain);
        // } else {
        ref.read(swapOriginChainProvider.notifier).setChain(selectedOrigin);
        ref.read(chainSwapFromProvider.notifier).setChain(SelectedTokenChain());
      }
    } else {
      ref.read(swapOriginChainProvider.notifier).setChain(selectedOrigin);
    }

    state = chain;
    ref.read(disableSwapProvider.notifier).validate();
  }
}

@riverpod
class SwapOriginChain extends _$SwapOriginChain {
  @override
  TokenChain build() {
    final tokenFrom = ref.watch(chainSwapFromProvider);
    final tokenTo = ref.watch(chainSwapToProvider);
    final originChain = ref.watch(listOriginChainSwapProvider);
    if (tokenFrom.id != null) {
      var selectedOrigin = originChain.singleWhere(
        (v) => v.chainId == tokenFrom.chainId,
        orElse: () => TokenChain(),
      );
      return selectedOrigin;
    }
    if (tokenTo.id != null) {
      var selectedOrigin = originChain.singleWhere(
        (v) => v.chainId == tokenTo.chainId,
        orElse: () => TokenChain(),
      );
      return selectedOrigin;
    }

    return TokenChain();
  }

  setChain(TokenChain chain) {
    state = chain;
  }
}

@riverpod
class ListOriginChainSwap extends _$ListOriginChainSwap {
  @override
  List<TokenChain> build() {
    final originChain = ref.watch(tokenChainOriginProvider).valueOrNull;
    final allToken = TokenChain(symbol: "All Network");
    final chainMainList =
        (originChain ?? []).where((e) => e.contractAddress == null).toList();

    chainMainList.insert(0, allToken);
    return chainMainList;
  }
}

@riverpod
class PairAddress extends _$PairAddress {
  @override
  Future<String> build() async {
    return '';
  }

  Future<void> getPair({
    required SelectedTokenChain tokenA,
    required SelectedTokenChain tokenB,
  }) async {
    try {
      final addressPair = await EvmSwap().getPairAddress(
        tokenA: tokenA.contractAddress ?? tokenA.wrapedAddress ?? '',
        tokenB: tokenB.contractAddress ?? tokenB.wrapedAddress ?? '',
        chain: tokenA,
      );
      log("pair address: ${addressPair?.hex}");

      state = AsyncData(addressPair?.hex ?? '');
    } catch (e, s) {
      log("Error fetching pair address: $e");
      log("StackTrace: $s");
    }
  }
}

@riverpod
class FromSwapAmount extends _$FromSwapAmount {
  @override
  TextEditingController build() => TextEditingController();

  onChange(String v) async {
    ref.read(loadingPriceImpactProvider.notifier).setLoading(true);
    ref.read(validationFromProvider.notifier).setValue(v);
    var tokenA = ref.read(chainSwapFromProvider);
    var tokenB = ref.read(chainSwapToProvider);
    final slippage = ref.read(slipPageProvider);

    if (tokenA.id != null && tokenB.id != null) {
      try {
        var amountIn = MethodHelper().doubleToBigInt(
          double.parse(v != '' ? v : '0'),
          tokenB.decimal ?? 18,
        );
        var amountOut = await EvmSwap().getAmountOut(
          amountIn: amountIn,
          chain: tokenA,
          path: [
            EthereumAddress.fromHex(
              tokenA.contractAddress ?? tokenA.wrapedAddress ?? '',
            ),
            EthereumAddress.fromHex(
              tokenB.contractAddress ?? tokenB.wrapedAddress ?? '',
            ),
          ],
        );

        final amountOutMin =
            (amountOut * BigInt.from(10000 - (slippage * 10000).toInt())) ~/
            BigInt.from(10000);
        log("amountOutMin => $amountOutMin");
        ref.read(amountOutMinProvider.notifier).setValue(amountOutMin);
        ref.read(toSwapAmountProvider).text =
            MethodHelper()
                .bigIntToDouble(amountOutMin, tokenB.decimal ?? 18)
                .toString();

        final addressPair = await EvmSwap().getPairAddress(
          tokenA: tokenA.contractAddress ?? tokenA.wrapedAddress ?? '',
          tokenB: tokenB.contractAddress ?? tokenB.wrapedAddress ?? '',
          chain: tokenA,
        );
        log("pair address: ${addressPair?.hex}");
        var reserves = await EvmSwap().getReserves(
          chain: tokenA,
          pairAddress: addressPair?.hex ?? '',
        );

        final BigInt reserve0 = reserves[0];
        final BigInt reserve1 = reserves[1];

        var token0 = await EvmSwap().getToken0(
          chain: tokenA,
          pairAddress: addressPair?.hex ?? '',
        );

        var tokenAddress = tokenA.contractAddress ?? tokenA.wrapedAddress ?? '';

        final isInputToken0 =
            tokenAddress.toLowerCase() == token0.hex.toLowerCase();

        final reserveIn = isInputToken0 ? reserve0 : reserve1;
        final reserveOut = isInputToken0 ? reserve1 : reserve0;

        final midPrice = reserveOut / reserveIn;
        final executionPrice = amountOut / amountIn;

        final priceImpact = ((midPrice - executionPrice) / midPrice) * 100;
        log("priceImpact => $priceImpact");
        ref.read(priceImpactProvider.notifier).setValue(priceImpact);
      } catch (e) {
        ref.read(toSwapAmountProvider).clear();
        ref.read(priceImpactProvider.notifier).setValue(0);
      }
    }
    ref.read(loadingPriceImpactProvider.notifier).setLoading(false);
    ref.read(disableSwapProvider.notifier).validate();
  }

  useBalanceMax() {
    var tokenFrom = ref.read(chainSwapFromProvider);
    if (tokenFrom.chainId != null) {
      state.text = tokenFrom.balance.toString();
      onChange(tokenFrom.balance.toString());
    }
  }
}

@riverpod
class ToSwapAmount extends _$ToSwapAmount {
  @override
  TextEditingController build() => TextEditingController();
  onChange(String v) async {
    ref.read(loadingPriceImpactProvider.notifier).setLoading(true);
    var tokenA = ref.read(chainSwapFromProvider);
    var tokenB = ref.read(chainSwapToProvider);
    final slippage = ref.read(slipPageProvider);
    if (tokenA.id != null && tokenB.id != null) {
      try {
        var amountOut = MethodHelper().doubleToBigInt(
          double.parse(v != '' ? v : '0'),
          tokenB.decimal ?? 18,
        );
        var amountIn = await EvmSwap().getAmountIn(
          amountOut: amountOut,
          chain: tokenA,
          path: [
            EthereumAddress.fromHex(
              tokenA.contractAddress ?? tokenA.wrapedAddress ?? '',
            ),
            EthereumAddress.fromHex(
              tokenB.contractAddress ?? tokenB.wrapedAddress ?? '',
            ),
          ],
        );

        final amountOutMin =
            (amountOut * BigInt.from(10000 - (slippage * 10000).toInt())) ~/
            BigInt.from(10000);
        log("amountOutMin => $amountOutMin");
        ref.read(amountOutMinProvider.notifier).setValue(amountOutMin);

        ref.read(fromSwapAmountProvider).text =
            MethodHelper()
                .bigIntToDouble(amountOutMin, tokenB.decimal ?? 18)
                .toString();

        final addressPair = await EvmSwap().getPairAddress(
          tokenA: tokenA.contractAddress ?? tokenA.wrapedAddress ?? '',
          tokenB: tokenB.contractAddress ?? tokenB.wrapedAddress ?? '',
          chain: tokenA,
        );

        var reserves = await EvmSwap().getReserves(
          chain: tokenA,
          pairAddress: addressPair?.hex ?? '',
        );

        final BigInt reserve0 = reserves[0];
        final BigInt reserve1 = reserves[1];

        var token0 = await EvmSwap().getToken0(
          chain: tokenA,
          pairAddress: addressPair?.hex ?? '',
        );

        var tokenAddress = tokenA.contractAddress ?? tokenA.wrapedAddress ?? '';

        final isInputToken0 =
            tokenAddress.toLowerCase() == token0.hex.toLowerCase();

        final reserveIn = isInputToken0 ? reserve0 : reserve1;
        final reserveOut = isInputToken0 ? reserve1 : reserve0;

        final midPrice = reserveOut / reserveIn;
        final executionPrice = amountOut / amountIn;

        final priceImpact = ((midPrice - executionPrice) / midPrice) * 100;
        log("priceImpact => $priceImpact");
        ref.read(priceImpactProvider.notifier).setValue(priceImpact);
      } catch (e) {
        ref.read(fromSwapAmountProvider).clear();
        ref.read(priceImpactProvider.notifier).setValue(0);
      }
    }
    ref.read(loadingPriceImpactProvider.notifier).setLoading(false);
    ref.read(disableSwapProvider.notifier).validate();
  }

  useBalanceMax() {
    var tokenTo = ref.read(chainSwapToProvider);
    if (tokenTo.chainId != null) {
      state.text = tokenTo.balance.toString();
      onChange(tokenTo.balance.toString());
    }
  }
}

@riverpod
class TxHashSwap extends _$TxHashSwap {
  @override
  Future<String> build() async => "";

  Future<void> swap(BuildContext ctx) async {
    try {
      ref.read(loadingSwapProvider.notifier).setLoading(true);
      var tokenA = ref.read(chainSwapFromProvider);
      var tokenB = ref.read(chainSwapToProvider);
      var account = ref.read(selectedAccountProvider).valueOrNull;
      var allowance = await EvmSwap().getAllowance(
        owner: EthereumAddress.fromHex(account?.addressETH ?? ""),
        chain: tokenA,
      );

      final amountInText = ref.watch(fromSwapAmountProvider).text;
      final amountIn = MethodHelper().doubleToBigInt(
        double.tryParse(amountInText.isNotEmpty ? amountInText : '0') ?? 0.0,
        tokenA.decimal ?? 18,
      );
      final amountOutMin = ref.watch(amountOutMinProvider);
      log("allowance => $allowance ");
      log("amountIn => $amountIn ");
      if (allowance < amountIn) {
        var aprove = await EvmSwap().approve(
          amount: amountIn,
          tokenIn: tokenA,
          privateKey: EcryptionHelper().decrypt(account?.keyETH ?? ""),
        );
        log("approve => $aprove ");
      }
      if (tokenA.contractAddress == null && tokenB.contractAddress != null) {
        var txHash = await EvmSwap().swapExactETHForTokens(
          ethAmount: amountIn,
          amountOutMin: amountOutMin,
          path: [
            EthereumAddress.fromHex(tokenA.wrapedAddress ?? ""),
            EthereumAddress.fromHex(tokenB.contractAddress ?? ""),
          ],
          privateKey: EcryptionHelper().decrypt(account?.keyETH ?? ""),
          chain: tokenA,
        );
        state = AsyncData(txHash);
      } else if (tokenA.contractAddress != null &&
          tokenB.contractAddress == null) {
        var txHash = await EvmSwap().swapExactTokensForEth(
          amountIn: amountIn,
          amountOutMin: amountOutMin,
          path: [
            EthereumAddress.fromHex(tokenA.contractAddress ?? ""),
            EthereumAddress.fromHex(tokenB.wrapedAddress ?? ""),
          ],
          privateKey: EcryptionHelper().decrypt(account?.keyETH ?? ""),
          chain: tokenA,
        );
        state = AsyncData(txHash);
      } else if (tokenA.contractAddress != null &&
          tokenB.contractAddress != null) {
        var txHash = await EvmSwap().swapExactTokensForTokens(
          amountIn: amountIn,
          amountOutMin: amountOutMin,
          path: [
            EthereumAddress.fromHex(tokenA.contractAddress ?? ""),
            EthereumAddress.fromHex(tokenB.contractAddress ?? ""),
          ],
          privateKey: EcryptionHelper().decrypt(account?.keyETH ?? ""),
          chain: tokenA,
        );
        log("txHash => $txHash");
        state = AsyncData(txHash);
      }
      ref.read(loadingSwapProvider.notifier).setLoading(false);
      ref.watch(fromSwapAmountProvider).clear();
      ref.watch(toSwapAmountProvider).clear();
      ref.read(balanceChainProvider.notifier).getBalance();
      MethodHelper().showSnack(
        context: ctx,
        content: "Swap Succesfully",
        backgorund: AppColor.greenColor,
      );
    } catch (e) {
      ref.read(loadingSwapProvider.notifier).setLoading(false);
      MethodHelper().showSnack(
        context: ctx,
        content: "Swap Failed",
        backgorund: AppColor.redColor,
      );
    }
  }
}

@riverpod
class DisableSwap extends _$DisableSwap {
  @override
  bool build() {
    return true;
  }

  validate() {
    var tokenA = ref.watch(chainSwapFromProvider);
    var tokenB = ref.watch(chainSwapToProvider);
    var fromAmount = ref.watch(fromSwapAmountProvider);
    var toAmount = ref.watch(toSwapAmountProvider);
    if (tokenA.id != null &&
        tokenB.id != null &&
        fromAmount.text != '' &&
        toAmount.text != '' &&
        double.parse(fromAmount.text.isNotEmpty ? fromAmount.text : '0') <=
            (tokenA.balance ?? 0)) {
      state = false;
    } else {
      state = true;
    }
  }
}

@riverpod
class LoadingSwap extends _$LoadingSwap {
  @override
  bool build() {
    return false;
  }

  setLoading(bool value) {
    state = value;
  }
}

@riverpod
class LoadingPriceImpact extends _$LoadingPriceImpact {
  @override
  bool build() {
    return false;
  }

  setLoading(bool value) {
    state = value;
  }
}

@riverpod
class PriceImpact extends _$PriceImpact {
  @override
  double build() {
    return 0;
  }

  setValue(double value) {
    state = value;
  }
}

@riverpod
class AmountOutMin extends _$AmountOutMin {
  @override
  BigInt build() {
    return BigInt.from(0);
  }

  setValue(BigInt value) {
    state = value;
  }
}

@riverpod
class SlipPage extends _$SlipPage {
  @override
  double build() {
    return 0.03;
  }

  setValue(double value) {
    state = value;
  }
}

@riverpod
class ValidationFrom extends _$ValidationFrom {
  @override
  String build() {
    return '';
  }

  setValue(String value) {
    var chain = ref.watch(chainSwapFromProvider);
    if (value == "") {
      state = "Amount Token From Can't be empty";
    } else if (double.parse(value) > (chain.balance ?? 0)) {
      state = "Insufficient Balance";
    } else {
      state = "";
    }
  }
}
