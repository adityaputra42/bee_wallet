import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bee_wallet/data/model/token_chain/token_chain.dart';
import 'package:bee_wallet/presentation/provider/provider.dart';
import 'package:bee_wallet/utils/util.dart';
import '../../../../../config/config.dart';
import '../../../../../data/src/src.dart';
import '../../../../widget/widget.dart';

class SheetNetworkAddToken extends ConsumerWidget {
  const SheetNetworkAddToken({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chainList =
        (ref.watch(tokenChainOriginProvider).valueOrNull ?? [])
            .where((e) => e.contractAddress == null)
            .toList();
    return Padding(
      padding: EdgeInsets.fromLTRB(
        24,
        0,
        24,
        MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SafeArea(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.7,
          child: Column(
            children: [
              Text(
                "Select Network",
                style: AppFont.semibold16.copyWith(
                  color: Theme.of(context).indicatorColor,
                ),
              ),
              height(16),
              const SearchField(),
              height(16),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).cardColor,
                  ),
                  child: ListView.builder(
                    itemBuilder:
                        (context, index) => Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: cardChain(context, chainList[index], ref),
                        ),
                    itemCount: chainList.length,
                  ),
                ),
              ),
              height(24),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardChain(BuildContext context, TokenChain chain, WidgetRef ref) {
    final selectedChain = ref.watch(networkAddTokenProvider);

    return GestureDetector(
      onTap: () {
        ref.read(networkAddTokenProvider.notifier).changeSelected(chain: chain);
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1,
            color:
                selectedChain.chainId == chain.chainId
                    ? AppColor.primaryColor
                    : Theme.of(context).colorScheme.surface,
          ),
          color: Theme.of(context).colorScheme.surface,
        ),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 32,
                  height: 32,
                  child: ClipPolygon(
                    sides: 6,
                    child: Container(
                      padding: EdgeInsets.all(0.5),
                      color: Theme.of(context).colorScheme.surface,
                      child: Image.asset(chain.logo ?? AppImage.logo),
                    ),
                  ),
                ),
                width(12),
                Expanded(
                  child: Text(
                    chain.name ?? '',
                    style: AppFont.medium16.copyWith(
                      color: Theme.of(context).indicatorColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
