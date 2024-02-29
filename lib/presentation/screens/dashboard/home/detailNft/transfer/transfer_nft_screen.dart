// ignore_for_file: use_build_context_synchronously

import 'package:blockies_ethereum/blockies_ethereum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bee_wallet/presentation/provider/provider.dart';
import 'package:bee_wallet/utils/util.dart';

import '../../../../../../config/config.dart';
import '../../../../../../data/src/src.dart';
import '../../../../../widget/widget.dart';
import 'sheet_confirmation_nft.dart';

class TransferNftScreen extends ConsumerWidget {
  const TransferNftScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nft = ref.watch(selectedNftProvider);
    final token = ref.watch(chainNftTransferProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: WidgetHelper.appBar(context: context, title: "Tranfer NFT"),
      body: Container(
        margin: EdgeInsets.all(16.w),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Theme.of(context).cardColor),
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Assets',
                        style: AppFont.medium14
                            .copyWith(color: Theme.of(context).hintColor),
                      ),
                      8.0.height,
                      Container(
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Theme.of(context).colorScheme.background),
                        child: Row(
                          children: [
                            ClipOval(
                              child: Image.memory(
                                MethodHelper().convertBase64ToUint8List(
                                    nft.imageByte ?? ''),
                                fit: BoxFit.cover,
                                width: 42.w,
                                height: 42.w,
                              ),
                            ),
                            8.0.width,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    nft.name ?? '',
                                    style: AppFont.medium14.copyWith(
                                        color:
                                            Theme.of(context).indicatorColor),
                                  ),
                                  4.0.height,
                                  Text(
                                    "Token ID : ${nft.tokenId}",
                                    style: AppFont.reguler12.copyWith(
                                        color: Theme.of(context).hintColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      16.0.height,
                      Text(
                        'From',
                        style: AppFont.medium14
                            .copyWith(color: Theme.of(context).hintColor),
                      ),
                      8.0.height,
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Theme.of(context).colorScheme.background),
                        child: Row(
                          children: [
                            Container(
                              width: 48.w,
                              height: 48.w,
                              padding: EdgeInsets.all(2.w),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 1.w,
                                      color: AppColor.primaryColor)),
                              child: Blockies(
                                  size: 0.6,
                                  data: nft.owner ?? "-",
                                  shape: BlockiesShape.circle),
                            ),
                            8.0.width,
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  MethodHelper().shortAddress(
                                      address: nft.owner ?? '', length: 8),
                                  style: AppFont.semibold14.copyWith(
                                      color: Theme.of(context).indicatorColor),
                                ),
                                4.0.height,
                                Text(
                                  "${token.balance ?? 0.0} ${token.symbol}",
                                  style: AppFont.medium12
                                      .copyWith(color: AppColor.grayColor),
                                )
                              ],
                            )),
                          ],
                        ),
                      ),
                      16.0.height,
                      InputText(
                        title: "To",
                        crossTitle: Image.asset(
                          AppIcon.scan,
                          width: 24.w,
                        ),
                        onChange: (v) =>
                            ref.read(receiveNftProvider.notifier).onChange(v),
                        validator: (v) =>
                            ref.read(receiveNftProvider.notifier).onValidate(v),
                        hintText: "Please enter address",
                        color: Theme.of(context).colorScheme.background,
                        controller: ref.watch(receiveNftProvider),
                        icon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            8.0.width,
                            GestureDetector(
                              onTap: () async {},
                              child: Text(
                                'Paste',
                                style: AppFont.reguler12
                                    .copyWith(color: AppColor.primaryColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      16.0.height,
                      Warning(
                        warning:
                            'Please ensure that the receive address supports the ${token.baseChain == 'eth' ? 'ERC-721' : token.baseChain == 'sol' ? 'Solana' : token.baseChain == 'tron' ? 'TRC20' : 'BRC20'}',
                        color: Theme.of(context).hintColor,
                      ),
                    ],
                  ),
                  PrimaryButton(
                      title: "Next",
                      margin: EdgeInsets.only(top: 24.h),
                      disable: ref.watch(disableGasFeeNFTProvider),
                      onPressed: () async {
                        await ref
                            .read(networkFeeNftProvider.notifier)
                            .getNetworkFee();
                        ref.watch(networkFeeNftProvider);
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => const SheetConfirmationNft(),
                            backgroundColor:
                                Theme.of(context).colorScheme.background,
                            showDragHandle: true,
                            isDismissible: false,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16.r))));
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
