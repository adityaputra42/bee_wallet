import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/config.dart';
import '../../../../../data/model/token_chain/token_chain.dart';
import '../../../../provider/provider.dart';
import 'new_dapps.dart';

class SheetSelectNetworkDapp extends ConsumerWidget {
  const SheetSelectNetworkDapp({super.key, this.url, required this.onSelect});
  final String? url;
  final Function() onSelect;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listChain = ref.watch(listChainSearchProvider);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        children: [
          Text(
            "Select Network",
            style: AppFont.medium14
                .copyWith(color: Theme.of(context).indicatorColor),
          ),
          height(16),
          // SearchField(),
          // 12.0.height,
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: cardChain(context, chain: listChain[index], ref: ref,
                    onTap: () {
                  ref
                      .read(tokenDappLinkProvider.notifier)
                      .onChange(listChain[index]);

                  Navigator.pop(context);
                  if (url != null && url!.isNotEmpty) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                NewWeb3Webview(initialUrl: url ?? '')));
                  } else {
                    onSelect();
                  }
                }),
              ),
              itemCount: listChain.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget cardChain(BuildContext context,
      {required TokenChain chain,
      required WidgetRef ref,
      required Function() onTap}) {
    final chainDapp = ref.watch(tokenDappLinkProvider);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                width: 1,
                color: chainDapp.chainId == chain.chainId &&
                        chainDapp.symbol == chain.symbol
                    ? AppColor.primaryColor
                    : Theme.of(context).cardColor),
            color: Theme.of(context).cardColor),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 36,
                  height: 36,
                  child: Stack(
                    children: [
                      Container(
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(chain.logo ?? ''))),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 1, color: Theme.of(context).cardColor),
                              image: DecorationImage(
                                  image: AssetImage(chain.baseLogo ?? ''))),
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
                //   width: 16.w,
                //   height: 16.w,
                //   child: Checkbox(
                //     value: chainDapp.chainId == chain.chainId ? true : false,
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
