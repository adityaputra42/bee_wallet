import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bee_wallet/presentation/provider/tokenChain/token_chain_provider.dart';
import 'package:bee_wallet/presentation/provider/transfer/transfer_provider.dart';
import 'package:bee_wallet/utils/util.dart';

import '../../../../../config/config.dart';
import '../../../../../data/model/token_chain/selected_token_chain.dart';
import '../../../../../data/src/src.dart';
import '../../../../widget/widget.dart';

class SheetChangeNetwork extends ConsumerWidget {
  const SheetChangeNetwork({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chainList = ref.watch(selectedChainTokenProvider).valueOrNull ?? [];

    return Padding(
      padding: EdgeInsets.fromLTRB(
          24, 0, 24, MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.7,
        child: Column(
          children: [
            Text(
              "Change Asset",
              style: AppFont.semibold16
                  .copyWith(color: Theme.of(context).indicatorColor),
            ),
            height(16),
            const SearchField(),
            height(16),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).cardColor),
                child: ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: cardChain(context, chainList[index], ref),
                  ),
                  itemCount: chainList.length,
                ),
              ),
            ),
            height(24)
          ],
        ),
      ),
    );
  }

  Widget cardChain(
      BuildContext context, SelectedTokenChain chain, WidgetRef ref) {
    final chainTransfer = ref.watch(chainTransferProvider);
    return GestureDetector(
      onTap: () {
        ref.read(chainTransferProvider.notifier).setChainTransfer(chain);

        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                width: 1,
                color: chainTransfer.chainId == chain.chainId &&
                        chainTransfer.symbol == chain.symbol
                    ? AppColor.primaryColor
                    : Theme.of(context).colorScheme.surface),
            color: Theme.of(context).colorScheme.surface),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 34,
                  height: 34,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 32,
                        height: 32,
                        child: ClipPolygon(
                          sides: 6,
                          child: Container(
                            padding: EdgeInsets.all(0.5),
                            color: Theme.of(context).colorScheme.surface,
                            child: (chain.logo != null)
                                ? Image.asset(chain.logo!)
                                : Image.asset(AppImage.logo),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: SizedBox(
                          width: 16,
                          height: 16,
                          child: ClipPolygon(
                            sides: 6,
                            child: Container(
                              padding: EdgeInsets.all(0.1),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.1,
                                      color: Theme.of(context).cardColor),
                                  color: Theme.of(context).colorScheme.surface),
                              child: (chain.baseLogo != null)
                                  ? Image.asset(chain.baseLogo!)
                                  : Image.asset(AppImage.logo),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                width(12),
                Expanded(
                  child: Text(
                    chain.name ?? '',
                    style: AppFont.reguler14
                        .copyWith(color: Theme.of(context).indicatorColor),
                  ),
                ),
                // SizedBox(
                //   width: 16,
                //   height: 16,
                //   child: Checkbox(
                //     value: chainDetail.chainId == chain.chainId ? true : false,
                //     onChanged: (v) {},
                //     activeColor: AppColor.primaryColor,
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(2.r)),
                //   ),
                // )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
