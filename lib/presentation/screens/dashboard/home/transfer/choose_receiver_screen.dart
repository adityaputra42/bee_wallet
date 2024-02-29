// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bee_wallet/config/theme/theme.dart';
import 'package:bee_wallet/data/src/app_icon.dart';
import 'package:bee_wallet/presentation/widget/widget.dart';

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
      appBar:
          WidgetHelper.appBar(context: context, title: "Send ${chain.name}"),
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
                      borderRadius: BorderRadius.circular(8.r),
                      gradient: AppColor.primaryGradient),
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
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Theme.of(context).colorScheme.background),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 34.w,
                        height: 34.w,
                        child: Stack(
                          children: [
                            Container(
                              width: 32.w,
                              height: 32.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(chain.logo ?? ''))),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                width: 14.w,
                                height: 14.w,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1.w,
                                        color: Theme.of(context).cardColor),
                                    image: DecorationImage(
                                        image:
                                            AssetImage(chain.baseLogo ?? ''))),
                              ),
                            ),
                          ],
                        ),
                      ),
                      8.0.width,
                      Text(
                        chain.symbol ?? '',
                        style: AppFont.medium16
                            .copyWith(color: Theme.of(context).indicatorColor),
                      ),
                      8.0.width,
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => const SheetChangeNetwork(),
                              backgroundColor:
                                  Theme.of(context).colorScheme.background,
                              showDragHandle: true,
                              isDismissible: false,
                              // isScrollControlled: true,
                              // useSafeArea: true,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(16.r))));
                        },
                        child: Image.asset(
                          AppIcon.changeIcon,
                          width: 16.w,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      24.0.width,
                      Expanded(
                        child: TextField(
                            controller: ref.watch(amountTransferProvider),
                            style: AppFont.medium16.copyWith(
                                color: Theme.of(context).indicatorColor),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.end,
                            onChanged: (value) {
                              ref
                                  .read(amountTransferProvider.notifier)
                                  .onAmountChange(value);
                            },
                            decoration: InputDecoration(
                              hintText: '0.0',
                              contentPadding: EdgeInsets.zero,
                              hintStyle: AppFont.reguler16
                                  .copyWith(color: Theme.of(context).hintColor),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide: const BorderSide(
                                    color: Colors.transparent, width: 0.5),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide: const BorderSide(
                                    color: Colors.transparent, width: 0.5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide: const BorderSide(
                                    color: Colors.transparent, width: 0.5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                              ),
                            )),
                      ),
                    ],
                  ),
                  8.0.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Available: ${chain.balance} ${chain.symbol}',
                        style: AppFont.reguler12
                            .copyWith(color: Theme.of(context).hintColor),
                      ),
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
                      )
                    ],
                  )
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
                    onTap: () async {
                      var clipBoard =
                          await Clipboard.getData(Clipboard.kTextPlain);
                      MethodHelper().pasteFromClipboard(
                          ref.watch(receiveAddressProvider));
                      ref.read(receiveAddressProvider.notifier).onAddressChange(
                            clipBoard?.text ?? "",
                          );
                    },
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
                  'Please ensure that the receive address supports the ${chain.baseChain == 'eth' ? 'ERC20' : chain.baseChain == 'sol' ? 'Solana' : chain.baseChain == 'tron' ? 'TRC20' : 'BRC20'}',
              color: Theme.of(context).hintColor,
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
