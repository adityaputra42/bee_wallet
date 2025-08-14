// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bee_wallet/config/theme/theme.dart';
import 'package:bee_wallet/presentation/widget/widget.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/ant_design.dart';

import '../../../../../data/src/src.dart';
import '../../../../../utils/util.dart';
import '../../../../provider/transfer/transfer_provider.dart';
import '../../../scan/scann_page.dart';
import 'sheet_change_chain.dart';

class ChooseReceiverScreen extends ConsumerWidget {
  const ChooseReceiverScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var chain = ref.watch(chainTransferProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: WidgetHelper.appBar(
        context: context,
        title: "Transfer",
        icon: InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => const SheetChangeNetwork(),
              backgroundColor: Theme.of(context).colorScheme.surface,
              showDragHandle: true,
              isDismissible: false,
              isScrollControlled: true,
              useSafeArea: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
            );
          },
          child: Container(
            height: 36,
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1, color: AppColor.grayColor),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 20,
                  height: 20,
                  child: ClipPolygon(
                    sides: 6,
                    child: Container(
                      padding: EdgeInsets.all(0.1),
                      color: Theme.of(context).colorScheme.surface,
                      child:
                          (chain.logo != null)
                              ? Image.asset(chain.logo!)
                              : Image.asset(AppImage.logo),
                    ),
                  ),
                ),
                // 4.0.width,
                Icon(
                  Icons.arrow_drop_down_rounded,
                  color: Theme.of(context).hintColor,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).cardColor,
          ),
          child: LayoutBuilder(
            builder:
                (context, constraints) => SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Assets',
                                  style: AppFont.medium14.copyWith(
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: AppColor.primaryColor,
                                  ),
                                  child: Text(
                                    chain.baseChain == 'eth'
                                        ? 'ERC-20'
                                        : chain.baseChain == 'sol'
                                        ? 'Solana'
                                        : chain.baseChain == 'btc'
                                        ? 'Bitcoin'
                                        : 'Sui',
                                    style: AppFont.reguler12.copyWith(
                                      color: AppColor.lightText1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            height(16),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Theme.of(context).colorScheme.surface,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 34,
                                          height: 34,
                                          child: Stack(
                                            children: [
                                              SizedBox(
                                                width: 32,
                                                height: 32,
                                                child: ClipPolygon(
                                                  sides: 6,
                                                  child: Container(
                                                    padding: EdgeInsets.all(
                                                      0.5,
                                                    ),
                                                    color:
                                                        Theme.of(
                                                          context,
                                                        ).colorScheme.surface,
                                                    child:
                                                        (chain.logo != null)
                                                            ? Image.asset(
                                                              chain.logo!,
                                                            )
                                                            : Image.asset(
                                                              AppImage.logo,
                                                            ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: SizedBox(
                                                  width: 16,
                                                  height: 16,
                                                  child: ClipPolygon(
                                                    sides: 6,
                                                    child: Container(
                                                      padding: EdgeInsets.all(
                                                        0.1,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          width: 0.1,
                                                          color:
                                                              Theme.of(
                                                                context,
                                                              ).cardColor,
                                                        ),
                                                        color:
                                                            Theme.of(context)
                                                                .colorScheme
                                                                .surface,
                                                      ),
                                                      child:
                                                          (chain.baseLogo !=
                                                                  null)
                                                              ? Image.asset(
                                                                chain.baseLogo!,
                                                              )
                                                              : Image.asset(
                                                                AppImage.logo,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        width(8),
                                        Expanded(
                                          child: Text(
                                            chain.name ?? '',
                                            style: AppFont.medium16.copyWith(
                                              color:
                                                  Theme.of(
                                                    context,
                                                  ).indicatorColor,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  width(16),
                                  Text(
                                    '${roundDouble(chain.balance ?? 0, 6)} ${chain.symbol}',
                                    style: AppFont.medium14.copyWith(
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            height(16),
                            InputText(
                              title: "Amount",
                              controller: ref.watch(amountTransferProvider),
                              keyboardType: TextInputType.number,
                              filled: true,
                              filledColor:
                                  Theme.of(context).colorScheme.surface,
                              onChange: (value) {
                                ref
                                    .read(disableNextTransferProvider.notifier)
                                    .onChangeAmount(value);
                              },
                              hintText: "0.000",
                              color: Theme.of(context).colorScheme.surface,
                              icon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  width(8),
                                  GestureDetector(
                                    onTap: () {
                                      ref
                                          .read(amountTransferProvider.notifier)
                                          .setAllFund(chain);
                                    },
                                    child: Text(
                                      'All Funds',
                                      style: AppFont.medium12.copyWith(
                                        color: AppColor.primaryColor,
                                      ),
                                    ),
                                  ),
                                  width(16),
                                ],
                              ),
                            ),
                            height(16),
                            InputText(
                              title: "To",
                              controller: ref.watch(receiveAddressProvider),
                              onChange: (value) {
                                ref
                                    .read(receiveAddressProvider.notifier)
                                    .onAddressChange(value);
                              },
                              filled: true,
                              filledColor:
                                  Theme.of(context).colorScheme.surface,
                              hintText: "Please enter address",
                              color: Theme.of(context).colorScheme.surface,
                              icon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  width(8),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => ScanPage(
                                                onScan: (result) {
                                                  ref
                                                      .read(
                                                        receiveAddressProvider
                                                            .notifier,
                                                      )
                                                      .setValue(result);
                                                  ref
                                                      .read(
                                                        receiveAddressProvider
                                                            .notifier,
                                                      )
                                                      .onAddressChange(
                                                        ref
                                                            .watch(
                                                              receiveAddressProvider,
                                                            )
                                                            .text,
                                                      );
                                                },
                                              ),
                                        ),
                                      );
                                    },
                                    child: Iconify(
                                      AntDesign.scan,
                                      size: 24,
                                      color: Theme.of(context).indicatorColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            height(16),
                            Warning(
                              warning:
                                  'Please ensure that the receive address supports the ${chain.baseChain == 'eth'
                                      ? 'ERC20'
                                      : chain.baseChain == 'sol'
                                      ? 'Solana'
                                      : chain.baseChain == 'tron'
                                      ? 'TRC20'
                                      : 'BRC20'}',
                            ),
                          ],
                        ),
                        PrimaryButton(
                          title: "Next",
                          disableColor: Theme.of(context).colorScheme.surface,
                          disable: ref.watch(disableNextTransferProvider),
                          onPressed: () async {
                            await ref
                                .read(networkFeeProvider.notifier)
                                .getNetworkFee();
                            ref.watch(networkFeeProvider);
                            context.goNamed("confirm_transfer_chain");
                          },
                        ),
                      ],
                    ),
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
