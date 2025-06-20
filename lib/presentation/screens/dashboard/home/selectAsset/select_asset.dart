import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:bee_wallet/presentation/provider/tokenChain/token_chain_provider.dart';

import '../../../../../config/config.dart';
import '../../../../../data/model/token_chain/selected_token_chain.dart';
import '../../../../../utils/util.dart';
import '../../../../provider/transfer/transfer_provider.dart';

class SelectAsset extends ConsumerWidget {
  const SelectAsset({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chainList = ref.watch(selectedChainTokenProvider).valueOrNull ?? [];
    chainList.removeWhere(
      (element) => element.baseChain == 'sol',
    );

    return Scaffold(
      appBar: WidgetHelper.appBar(context: context, title: "Select Asset"),
      body: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(bottom: 8, top: index == 0 ? 16 : 0),
          child: cardChain(context, chainList[index], ref),
        ),
        itemCount: chainList.length,
      ),
    );
  }

  Widget cardChain(
      BuildContext context, SelectedTokenChain chain, WidgetRef ref) {
    final chainTransfer = ref.watch(chainTransferProvider);
    return GestureDetector(
      onTap: () {
        ref.read(chainTransferProvider.notifier).setChainTransfer(chain);
        ref.watch(chainTransferProvider);
        context.goNamed('choose_receiver');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).cardColor),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  chain.logo ?? '',
                  height: 32,
                ),
                width(12),
                Expanded(
                  child: Text(
                    chain.name ?? '',
                    style: AppFont.reguler14
                        .copyWith(color: Theme.of(context).indicatorColor),
                  ),
                ),
                SizedBox(
                  width: 16,
                  height: 16,
                  child: Checkbox(
                    value:
                        chainTransfer.chainId == chain.chainId ? true : false,
                    onChanged: (v) {},
                    activeColor: AppColor.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2)),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
