// ignore_for_file: use_build_context_synchronously

import 'dart:developer' as dev;
import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../config/config.dart';
import '../../../data/model/token_chain/selected_token_chain.dart';
import '../../../utils/util.dart';
import '../account/account_provider.dart';

part 'transfer_provider.g.dart';

@riverpod
class ChainTransfer extends _$ChainTransfer {
  @override
  SelectedTokenChain build() {
    return SelectedTokenChain();
  }

  setChainTransfer(SelectedTokenChain chain) {
    state = chain;
    ref.read(receiveAddressProvider).clear();
    ref.read(amountTransferProvider).clear();
  }
}

@riverpod
class AmountTransfer extends _$AmountTransfer {
  @override
  TextEditingController build() => TextEditingController();

  setAllFund(SelectedTokenChain chain) {
    state.text = chain.balance.toString();
  }

  onAmountChange(String value) {
    String address = ref.watch(receiveAddressProvider).text;
    final chain = ref.watch(chainTransferProvider);
    ref.read(validateAddressTransferProvider.notifier).validateAddress(address);
    bool isValid = ref.watch(validateAddressTransferProvider);
    if (state.text != '' &&
        address != '' &&
        isValid == true &&
        chain.balance! >= double.parse(state.text)) {
      ref.read(disableNextTransferProvider.notifier).changeValue(false);
    } else {
      ref.read(disableNextTransferProvider.notifier).changeValue(true);
    }
  }
}

@riverpod
class ReceiveAddress extends _$ReceiveAddress {
  @override
  TextEditingController build() => TextEditingController();
  setValue(String value) {
    state.text = value;
  }

  onAddressChange(String value) {
    ref.read(validateAddressTransferProvider.notifier).validateAddress(value);
    bool isValid = ref.watch(validateAddressTransferProvider);
    final chain = ref.watch(chainTransferProvider);
    final amount = ref.watch(amountTransferProvider);
    if (state.text != '' &&
        amount.text != '' &&
        isValid == true &&
        chain.balance! >= double.parse(amount.text)) {
      ref.read(disableNextTransferProvider.notifier).changeValue(false);
    } else {
      ref.read(disableNextTransferProvider.notifier).changeValue(true);
    }
  }
}

@riverpod
class ValidateAddressTransfer extends _$ValidateAddressTransfer {
  @override
  bool build() {
    return true;
  }

  validateAddress(String address) {
    final chain = ref.watch(chainTransferProvider);
    if (chain.baseChain == 'eth') {
      state = EthHelper().validateAddress(address);
    } else if (chain.baseChain == 'sol') {
      state = SolanaHelper().isValidSolanaAddress(address);
    } else if (chain.baseChain == 'sui') {
      state = true;
    } else {
      state = false;
    }
  }
}

@riverpod
class DisableNextTransfer extends _$DisableNextTransfer {
  @override
  bool build() => true;

  changeValue(bool value) {
    state = value;
  }
}

@riverpod
class NetworkFee extends _$NetworkFee {
  @override
  double build() => 0;
  Future<void> getNetworkFee() async {
    var chain = ref.watch(chainTransferProvider);
    var amount = double.parse(ref.watch(amountTransferProvider).text);
    var account = ref.watch(selectedAccountProvider).valueOrNull;
    double fee = 0.0;
    if (chain.baseChain == 'eth') {
      if (chain.contractAddress == null) {
        var data = await EthHelper().getEstimateGasFee(
            to: ref.watch(receiveAddressProvider).text,
            amount: 0,
            privateKey: EcryptionHelper().decrypt(account?.keyETH ?? ''),
            chain: chain);
        fee = data['txFee'];
        ref
            .read(gasLimitProvider.notifier)
            .changeInit(data['gasLimit'].toString());
        ref
            .read(gasPriceProvider.notifier)
            .changeInit(data['gasPrice'].ceilToDouble().toString());
        state = fee;
      } else {
        var data = await EthHelper().getEstimateGasTokenTransfer(
            to: ref.watch(receiveAddressProvider).text,
            amount: 0,
            privateKey: EcryptionHelper().decrypt(account?.keyETH ?? ''),
            chainToken: chain);
        fee = data['txFee'];
        ref
            .read(gasLimitProvider.notifier)
            .changeInit(data['gasLimit'].toString());
        ref
            .read(gasPriceProvider.notifier)
            .changeInit(data['gasPrice'].ceilToDouble().toString());
        state = fee;
      }
    } else if (chain.baseChain == 'sol') {
      var data = await SolanaHelper().getEstimateFee(
          from: account?.addressSolana ?? '',
          to: ref.watch(receiveAddressProvider).text);
      fee = data['txFee'];
      ref
          .read(gasLimitProvider.notifier)
          .changeInit(data['gasLimit'].toString());
      ref
          .read(gasPriceProvider.notifier)
          .changeInit(data['gasPrice'].ceilToDouble().toString());
      state = fee;
    } else if (chain.baseChain == 'sui') {
      var data = await SuiHelper().getEstimateFee(
          amount: amount,
          isTestnet: chain.isTestnet!,
          from: account!,
          to: ref.watch(receiveAddressProvider).text);
      fee = data['txFee'];
      ref
          .read(gasLimitProvider.notifier)
          .changeInit(data['gasLimit'].toString());
      ref
          .read(gasPriceProvider.notifier)
          .changeInit(data['gasPrice'].ceilToDouble().toString());
      state = fee;
    }

    if (amount < (chain.balance ?? 0)) {
      ref.read(amountSendProvider.notifier).setAmount(amount - fee);
      ref.watch(amountSendProvider);
    } else {
      ref.read(amountSendProvider.notifier).setAmount(amount);
      ref.watch(amountSendProvider);
    }
    ref.read(slowNetworkFeeProvider.notifier).setNetworkFee(fee);
    ref.read(averageNetworkFeeProvider.notifier).setNetworkFee(fee);
    ref.read(fastNetworkFeeProvider.notifier).setNetworkFee(fee);
    ref.watch(slowNetworkFeeProvider);
    ref.watch(averageNetworkFeeProvider);
    ref.watch(fastNetworkFeeProvider);
    ref.watch(gasLimitProvider);
    ref.watch(gasPriceProvider);
  }

  void setAdvanceGasFee() {
    var gasPrice = ref.watch(gasPriceProvider).text;
    var gasLimit = ref.watch(gasLimitProvider).text;
    final txFee = BigInt.from(double.parse(gasPrice)) *
        BigInt.from(double.parse(gasLimit));
    var fee = txFee / BigInt.from(10).pow(9);
    state = fee;
  }
}

@riverpod
class SlowNetworkFee extends _$SlowNetworkFee {
  @override
  double build() => 0;
  setNetworkFee(double fee) {
    state = fee - (fee * 0.33);
  }
}

@riverpod
class AverageNetworkFee extends _$AverageNetworkFee {
  @override
  double build() => 0;
  setNetworkFee(double fee) {
    state = fee;
  }
}

@riverpod
class FastNetworkFee extends _$FastNetworkFee {
  @override
  double build() => 0;
  setNetworkFee(double fee) {
    state = fee + (fee * 0.33);
  }
}

@riverpod
class SelectedFee extends _$SelectedFee {
  @override
  int build() => 1;
  setSelectedFee(int value) {
    state = value;
  }
}

@riverpod
class AmountSend extends _$AmountSend {
  @override
  double build() => 0;

  setAmount(double value) {
    state = value;
    dev.log("Amount Send => $value");
  }
}

@riverpod
class TransferChain extends _$TransferChain {
  @override
  Future<bool> build() async => false;

  Future<void> tranfer(BuildContext context) async {
    var chain = ref.watch(chainTransferProvider);
    var amount = ref.watch(amountSendProvider);
    var account = ref.watch(selectedAccountProvider).valueOrNull;

    state = const AsyncLoading();
    try {
      if (chain.baseChain == 'eth') {
        if (chain.contractAddress == null) {
          await EthHelper().transferChain(
            to: ref.watch(receiveAddressProvider).text,
            amount: amount,
            chain: chain,
            privateKey: EcryptionHelper().decrypt(account?.keyETH ?? ''),
          );
          state = const AsyncData(true);
        } else {
          await EthHelper().transferToken(
            to: ref.watch(receiveAddressProvider).text,
            amount: amount,
            token: chain,
            privateKey: EcryptionHelper().decrypt(account?.keyETH ?? ''),
          );
          state = const AsyncData(true);
        }
      } else if (chain.baseChain == 'sol') {
        await SolanaHelper().sendSolanaTransaction(
            from: account!,
            to: ref.watch(receiveAddressProvider).text,
            amount: amount);
        state = const AsyncData(true);
      } else if (chain.baseChain == 'sui') {
        await SuiHelper().transfer(
            to: ref.watch(receiveAddressProvider).text,
            amount: amount,
            from: account!,
            isTestnet: chain.isTestnet!);
        state = const AsyncData(true);
      } else if (chain.baseChain == 'btc') {
        await BtcHelper().sendTx(
            amount: amount.toInt(),
            addressStr: ref.watch(receiveAddressProvider).text,
            secretKey: EcryptionHelper().decrypt(account?.keyBTC ?? ''));
        state = const AsyncData(true);
      }

      context.goNamed('transaction_progress');
    } catch (e) {
      dev.log("error => $e");
      MethodHelper().showSnack(
          context: context, content: "Error $e", backgorund: AppColor.redColor);
      state = const AsyncData(false);
    }
  }
}

@riverpod
class GasLimit extends _$GasLimit {
  @override
  TextEditingController build() => TextEditingController();

  changeInit(String value) {
    state.text = value;
  }
}

@riverpod
class GasPrice extends _$GasPrice {
  @override
  TextEditingController build() => TextEditingController();
  changeInit(String value) {
    state.text = value;
  }
}
