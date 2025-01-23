import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
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
                        controller: ref.watch(gasPriceNFTProvider),
                        title: 'Gas Price',
                        color: Theme.of(context).colorScheme.surface,
                        icon: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.cancel,
                              size: 16,
                              color: Theme.of(context).hintColor,
                            ),
                            width(8),
                            Text(
                              "Gwei",
                              style: AppFont.reguler12.copyWith(
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                            width(16)
                          ],
                        ),
                      ),
                      height(16),
                      InputText(
                        hintText: "Enter gas limit",
                        title: 'Gas Limit',
                        controller: ref.watch(gasLimitNFTProvider),
                        color: Theme.of(context).colorScheme.surface,
                        icon: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.cancel,
                              size: 16,
                              color: Theme.of(context).hintColor,
                            ),
                            width(16)
                          ],
                        ),
                      ),
                    ],
                  ),
                  PrimaryButton(
                    title: 'Save',
                    onPressed: () {
                      ref
                          .read(networkFeeNftProvider.notifier)
                          .setAdvanceGasFee();
                      ref
                          .read(selectedFeeNftProvider.notifier)
                          .setSelectedFee(3);
                      context.pop();
                    },
                    margin: EdgeInsets.only(top: 32),
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
