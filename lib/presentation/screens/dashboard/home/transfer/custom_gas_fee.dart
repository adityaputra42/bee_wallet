import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:bee_wallet/config/theme/theme.dart';
import 'package:bee_wallet/presentation/provider/transfer/transfer_provider.dart';
import 'package:bee_wallet/presentation/widget/widget.dart';

import '../../../../../utils/util.dart';

class CustomGasFee extends ConsumerWidget {
  const CustomGasFee({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: WidgetHelper.appBar(context: context, title: "Advance"),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: Theme.of(context).cardColor),
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InputText(
                        hintText: "Enter gas price",
                        controller: ref.watch(gasPriceProvider),
                        title: 'Gas Price',
                        color: Theme.of(context).colorScheme.surface,
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
                        controller: ref.watch(gasLimitProvider),
                        color: Theme.of(context).colorScheme.surface,
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
                  PrimaryButton(
                    title: 'Save',
                    onPressed: () {
                      ref.read(networkFeeProvider.notifier).setAdvanceGasFee();
                      ref.read(selectedFeeProvider.notifier).setSelectedFee(3);
                      context.pop();
                    },
                    margin: EdgeInsets.only(top: 32.h),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
