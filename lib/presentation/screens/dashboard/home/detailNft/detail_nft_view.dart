import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../config/config.dart';
import '../../../../../data/model/model.dart';
import '../../../../../utils/util.dart';
import '../../../../provider/provider.dart';

class DetailNftView extends ConsumerStatefulWidget {
  const DetailNftView({super.key});

  @override
  ConsumerState<DetailNftView> createState() => _DetailNftViewState();
}

class _DetailNftViewState extends ConsumerState<DetailNftView> {
  @override
  void initState() {
    ref.read(nftHistoryProvider.notifier).init();

    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final nftView = ref.watch(selectedViewNftProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: WidgetHelper.appBar(context: context, title: "Detail NFT"),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 84,
                  height: 84,
                  child: ClipPolygon(
                    sides: 6,
                    child: Container(
                      padding: EdgeInsets.all(1),
                      decoration:
                          const BoxDecoration(color: AppColor.primaryColor),
                      child: ClipPolygon(
                        sides: 6,
                        child: Container(
                          padding: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                          ),
                          child: Image.memory(
                            MethodHelper()
                                .convertBase64ToUint8List(nftView.image ?? ''),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                widget.width(8),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nftView.name ?? '',
                      style: AppFont.medium16
                          .copyWith(color: Theme.of(context).indicatorColor),
                    ),
                    widget.width(4),
                    Text(
                      "Owned : ${nftView.length}",
                      style:
                          AppFont.medium14.copyWith(color: AppColor.grayColor),
                    ),
                    widget.width(4),
                    Row(
                      children: [
                        Text(
                          MethodHelper().shortAddress(
                              address: nftView.contract ?? '', length: 8),
                          style: AppFont.medium14
                              .copyWith(color: AppColor.grayColor),
                        ),
                        widget.width(8),
                        GestureDetector(
                          onTap: () {
                            MethodHelper().handleCopy(
                                data: nftView.contract ?? '', context: context);
                          },
                          child: Icon(
                            Icons.copy_rounded,
                            color: AppColor.primaryColor,
                            size: 16,
                          ),
                        )
                      ],
                    ),
                  ],
                ))
              ],
            ),
            widget.height(16),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).cardColor,
                ),
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: List.generate(
                          nftView.listNft!.length,
                          (index) =>
                              cardNft(nftView.listNft![index], context, ref)),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget cardActivity(
      {required BuildContext context,
      required Activity activity,
      String? address,
      TokenChain? chain}) {
    String state = activity.from == address ? "Transfer" : "Receiced";
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.surface),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).cardColor,
              ),
              child: Icon(
                state == "Transfer" ? Icons.arrow_upward : Icons.arrow_downward,
                size: 16,
                color: AppColor.primaryColor,
              ),
            ),
            widget.width(8),
            Expanded(
                child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$state  ${activity.symbol == "" ? chain?.symbol : activity.symbol}',
                      style: AppFont.medium14
                          .copyWith(color: Theme.of(context).indicatorColor),
                    ),
                    Text(
                      DateFormat("hh:mm a")
                          .format(DateTime.fromMillisecondsSinceEpoch(
                                  int.parse(activity.timeStamp!) * 1000)
                              .toLocal())
                          .toLowerCase(),
                      style: AppFont.medium12
                          .copyWith(color: Theme.of(context).indicatorColor),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "to : ${activity.to != null ? MethodHelper().shortAddress(address: activity.to ?? "~", length: 5) : "~"}",
                      style: AppFont.reguler12
                          .copyWith(color: Theme.of(context).indicatorColor),
                    ),
                    Text(
                      "${(BigInt.parse(activity.value!).toDouble() / pow(10, 18)).toStringAsFixed(5)} ${activity.symbol == "" ? chain?.symbol : activity.symbol}",
                      style: AppFont.medium14
                          .copyWith(color: Theme.of(context).indicatorColor),
                    ),
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget cardNft(Nft nft, BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(selectedNftProvider.notifier).changeValue(nft);
        ref.watch(selectedNftProvider);
        context.goNamed('detail_nft');
      },
      child: Container(
        height: 220,
        width: MediaQuery.of(context).size.width * 0.412,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.surface),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(6),
                  bottom: Radius.circular(4),
                ),
                child: Image.memory(
                  MethodHelper().convertBase64ToUint8List(
                    nft.imageByte ?? '',
                  ),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nft.name ?? '',
                    style: AppFont.medium14
                        .copyWith(color: Theme.of(context).indicatorColor),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "#${nft.tokenId}",
                    style: AppFont.reguler12
                        .copyWith(color: Theme.of(context).indicatorColor),
                  ),
                  widget.height(8),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
