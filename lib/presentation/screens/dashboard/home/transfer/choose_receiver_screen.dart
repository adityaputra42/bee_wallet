// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bee_wallet/config/theme/theme.dart';
import 'package:bee_wallet/presentation/widget/widget.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/ant_design.dart';

import '../../../../../data/src/src.dart';
import '../../../../../utils/util.dart';
import '../../../../provider/transfer/transfer_provider.dart';
import 'sheet_change_chain.dart';
import 'sheet_confirm_transfer.dart';

class ChooseReceiverScreen extends ConsumerWidget {
  const ChooseReceiverScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var chain = ref.watch(chainTransferProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: WidgetHelper.appBar(
        context: context,
        title: "Transfer",
        icon: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => const SheetChangeNetwork(),
                  backgroundColor: Theme.of(context).colorScheme.background,
                  showDragHandle: true,
                  isDismissible: false,
                  isScrollControlled: true,
                  useSafeArea: true,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16.r))));
            },
            child: Container(
              height: 36.w,
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(width: 1.w, color: AppColor.grayColor)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 20.w,
                    height: 20.w,
                    child: ClipPolygon(
                      sides: 6,
                      child: Container(
                        padding: EdgeInsets.all(0.1.h),
                        color: Theme.of(context).colorScheme.background,
                        child: (chain.logo != null)
                            ? Image.asset(chain.logo!)
                            : Image.asset(AppImage.logo),
                      ),
                    ),
                  ),
                  // 4.0.width,
                  // Text(
                  //   chain.symbol ?? '',
                  //   style: AppFont.medium12
                  //       .copyWith(color: Theme.of(context).indicatorColor),
                  // ),
                  Icon(
                    Icons.arrow_drop_down_rounded,
                    color: Theme.of(context).hintColor,
                    size: 20.w,
                  ),
                ],
              ),
            )),
      ),
      body: Container(
        margin: EdgeInsets.all(16.w),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Theme.of(context).cardColor),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Assets',
                  style: AppFont.medium14
                      .copyWith(color: Theme.of(context).hintColor),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: AppColor.primaryColor),
                  child: Text(
                    chain.baseChain == 'eth'
                        ? 'ERC-20'
                        : chain.baseChain == 'sol'
                            ? 'Solana'
                            : chain.baseChain == 'tron'
                                ? 'TRC-20'
                                : 'BRC-20',
                    style: AppFont.reguler12
                        .copyWith(color: AppColor.textStrongDark),
                  ),
                )
              ],
            ),
            16.0.height,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: Theme.of(context).colorScheme.background),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 34.w,
                          height: 34.w,
                          child: Stack(
                            children: [
                              SizedBox(
                                width: 32.w,
                                height: 32.w,
                                child: ClipPolygon(
                                  sides: 6,
                                  child: Container(
                                    padding: EdgeInsets.all(0.5.h),
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    child: (chain.logo != null)
                                        ? Image.asset(chain.logo!)
                                        : Image.asset(AppImage.logo),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: SizedBox(
                                  width: 16.w,
                                  height: 16.w,
                                  child: ClipPolygon(
                                    sides: 6,
                                    child: Container(
                                      padding: EdgeInsets.all(0.1.h),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 0.1.w,
                                              color:
                                                  Theme.of(context).cardColor),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background),
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
                        8.0.width,
                        Expanded(
                          child: Text(
                            chain.name ?? '',
                            style: AppFont.medium16.copyWith(
                                color: Theme.of(context).indicatorColor),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  16.0.width,
                  Text(
                    '${chain.balance} ${chain.symbol}',
                    style: AppFont.medium14
                        .copyWith(color: Theme.of(context).hintColor),
                  ),
                ],
              ),
            ),
            16.0.height,
            InputText(
              title: "Amount",
              controller: ref.watch(amountTransferProvider),
              keyboardType: TextInputType.number,
              onChange: (value) {
                ref.read(amountTransferProvider.notifier).onAmountChange(value);
              },
              hintText: "0.000",
              color: Theme.of(context).colorScheme.background,
              icon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  8.0.width,
                  GestureDetector(
                    onTap: () {
                      ref
                          .read(amountTransferProvider.notifier)
                          .setAllFund(chain);
                    },
                    child: Text(
                      'All Funds',
                      style: AppFont.medium12
                          .copyWith(color: AppColor.primaryColor),
                    ),
                  ),
                  16.0.width
                ],
              ),
            ),
            16.0.height,
            InputText(
              title: "To",
              controller: ref.watch(receiveAddressProvider),
              onChange: (value) {
                ref
                    .read(receiveAddressProvider.notifier)
                    .onAddressChange(value);
              },
              hintText: "Please enter address",
              color: Theme.of(context).colorScheme.background,
              icon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  8.0.width,
                  GestureDetector(
                      onTap: () {},
                      child: Iconify(
                        AntDesign.scan,
                        size: 24.w,
                        color: Theme.of(context).indicatorColor,
                      )),
                ],
              ),
            ),
            16.0.height,
            Warning(
              warning:
                  'Please ensure that the receive address supports the ${chain.baseChain == 'eth' ? 'ERC20' : chain.baseChain == 'sol' ? 'Solana' : chain.baseChain == 'tron' ? 'TRC20' : 'BRC20'}',
            ),
            const Spacer(),
            PrimaryButton(
                title: "Next",
                disable: ref.watch(disableNextTransferProvider),
                onPressed: () async {
                  await ref.read(networkFeeProvider.notifier).getNetworkFee();
                  ref.watch(networkFeeProvider);
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => const SheetConfirmTransfer(),
                      backgroundColor: Theme.of(context).colorScheme.background,
                      showDragHandle: true,
                      isDismissible: false,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16.r))));
                })
          ],
        ),
      ),
    );
  }
}
