import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:bee_wallet/presentation/provider/provider.dart';

import '../../../../../config/config.dart';
import '../../../../../utils/util.dart';
import '../../../../widget/widget.dart';

class DetailNft extends ConsumerWidget {
  const DetailNft({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nft = ref.watch(selectedNftProvider);
    final chain = ref.watch(tokenChainNftProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: WidgetHelper.appBar(context: context, title: "Detail NFT"),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).cardColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.memory(
                      MethodHelper().convertBase64ToUint8List(
                        nft.imageByte ?? '',
                      ),
                      width: double.infinity,
                      height: context.h(0.48),
                      fit: BoxFit.fill,
                    ),
                  ),
                  height(16),
                  Text(
                    nft.name ?? '',
                    style: AppFont.semibold20.copyWith(
                      color: Theme.of(context).indicatorColor,
                    ),
                  ),
                ],
              ),
              height(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Contract Address :",
                    style: AppFont.medium14.copyWith(color: AppColor.grayColor),
                  ),
                  Row(
                    children: [
                      Text(
                        MethodHelper().shortAddress(
                          address: nft.contractAddress ?? '',
                          length: 8,
                        ),
                        style: AppFont.medium14.copyWith(
                          color: Theme.of(context).indicatorColor,
                        ),
                      ),
                      width(8),
                      Icon(
                        Icons.copy_rounded,
                        size: 16,
                        color: AppColor.primaryColor,
                      ),
                    ],
                  ),
                ],
              ),
              height(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Token Id : ",
                    style: AppFont.medium14.copyWith(color: AppColor.grayColor),
                  ),
                  Row(
                    children: [
                      Text(
                        "#${nft.tokenId}",
                        style: AppFont.medium14.copyWith(
                          color: Theme.of(context).indicatorColor,
                        ),
                      ),
                      width(8),
                      Icon(
                        Icons.copy_rounded,
                        size: 16,
                        color: AppColor.primaryColor,
                      ),
                    ],
                  ),
                ],
              ),
              height(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Standart Token : ",
                    style: AppFont.medium14.copyWith(color: AppColor.grayColor),
                  ),
                  Text(
                    "ERC-721",
                    style: AppFont.medium14.copyWith(
                      color: Theme.of(context).indicatorColor,
                    ),
                  ),
                ],
              ),
              height(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Mainnet : ",
                    style: AppFont.medium14.copyWith(color: AppColor.grayColor),
                  ),
                  Text(
                    "${chain.name}",
                    style: AppFont.medium14.copyWith(
                      color: Theme.of(context).indicatorColor,
                    ),
                  ),
                ],
              ),
              height(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Owner : ",
                    style: AppFont.medium14.copyWith(color: AppColor.grayColor),
                  ),
                  Row(
                    children: [
                      Text(
                        MethodHelper().shortAddress(
                          address: nft.owner ?? '',
                          length: 8,
                        ),
                        style: AppFont.medium14.copyWith(
                          color: Theme.of(context).indicatorColor,
                        ),
                      ),
                      width(8),
                      Icon(
                        Icons.copy_rounded,
                        size: 16,
                        color: AppColor.primaryColor,
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              PrimaryButton(
                title: "Send",
                onPressed: () {
                  context.goNamed('transfer_nft');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
