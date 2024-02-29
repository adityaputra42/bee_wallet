import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:bee_wallet/config/theme/theme.dart';
import 'package:bee_wallet/presentation/widget/widget.dart';
import 'package:bee_wallet/utils/util.dart';

import '../../../../../provider/nft/nft_provider.dart';

class CustomGasFeeNFT extends ConsumerWidget {
  const CustomGasFeeNFT({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: WidgetHelper.appBar(context: context, title: "Advance"),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Theme.of(context).cardColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputText(
                    hintText: "Enter gas price",
                    controller: ref.watch(gasPriceNFTProvider),
                    title: 'Gas Price',
                    color: Theme.of(context).colorScheme.background,
                    icon: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.cancel,
                          size: 16.w,
                          color: Theme.of(context).hintColor,
                        ),
                        8.0.width,
                        Text(
                          "Gwei",
                          style: AppFont.reguler12.copyWith(
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        16.0.width,
                      ],
                    ),
                  ),
                  16.0.height,
                  InputText(
                    hintText: "Enter gas limit",
                    title: 'Gas Limit',
                    controller: ref.watch(gasLimitNFTProvider),
                    color: Theme.of(context).colorScheme.background,
                    icon: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.cancel,
                          size: 16.w,
                          color: Theme.of(context).hintColor,
                        ),
                        16.0.width,
                      ],
                    ),
                  ),
                ],
              ),
            ),
            PrimaryButton(
              title: 'Save',
              onPressed: () {
                ref.read(networkFeeNftProvider.notifier).setAdvanceGasFee();
                ref.read(selectedFeeNftProvider.notifier).setSelectedFee(3);
                context.pop();
              },
              margin: EdgeInsets.only(top: 32.h),
            )
          ],
        ),
      ),
    );
  }
}
