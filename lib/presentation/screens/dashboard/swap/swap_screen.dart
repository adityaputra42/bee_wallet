import 'package:bee_wallet/config/config.dart';
import 'package:bee_wallet/presentation/widget/widget.dart';
import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/src/src.dart';
import '../../../provider/swap/swap_provider.dart';
import '../../../widget/button_loading.dart';
import '../../../widget/card_general.dart';
import '../../../widget/page_custom.dart';
import 'sheet_change_chain_token_swap.dart';

class SwapScreen extends ConsumerWidget {
  SwapScreen({super.key});

  final debounc = DebouncerHelper(milliseconds: 500);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var chainFrom = ref.watch(chainSwapFromProvider);
    var chainTo = ref.watch(chainSwapToProvider);
    var priceImpact = ref.watch(priceImpactProvider);
    var slippage = ref.watch(slipPageProvider);
    var validateFrom = ref.watch(validationFromProvider);

    return PageCustom(
      child: Column(
        children: [
          height(16),
          Center(
            child: Text(
              "Swap",
              style: AppFont.medium14.copyWith(
                color: Theme.of(context).indicatorColor,
              ),
            ),
          ),
          Expanded(
            child: CardGeneral(
              width: double.infinity,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CardGeneral(
                                  margin: EdgeInsets.zero,
                                  background:
                                      Theme.of(context).colorScheme.surface,
                                  border: Border.all(
                                    width: 0.2,
                                    color: Theme.of(context).canvasColor,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "From",
                                            style: AppFont.medium14.copyWith(
                                              color:
                                                  Theme.of(context).hintColor,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              ref
                                                  .read(
                                                    fromSwapAmountProvider
                                                        .notifier,
                                                  )
                                                  .useBalanceMax();
                                            },
                                            child: Text(
                                              "Use Max",
                                              style: AppFont.medium14.copyWith(
                                                color:
                                                    Theme.of(
                                                      context,
                                                    ).indicatorColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      height(8),
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 6,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                InputText(
                                                  borderSide: BorderSide.none,
                                                  controller: ref.watch(
                                                    fromSwapAmountProvider,
                                                  ),
                                                  onChange: (v) {
                                                    debounc.run(() {
                                                      ref
                                                          .read(
                                                            fromSwapAmountProvider
                                                                .notifier,
                                                          )
                                                          .onChange(v);
                                                    });
                                                  },
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter.allow(
                                                      RegExp(r'^[0-9.]*'),
                                                    ),
                                                  ],
                                                  contentPadding:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 4,
                                                        vertical: 0,
                                                      ),
                                                  hintStyle: AppFont.medium18
                                                      .copyWith(
                                                        color:
                                                            Theme.of(
                                                              context,
                                                            ).hintColor,
                                                      ),
                                                  textStyle: AppFont.semibold18
                                                      .copyWith(
                                                        color:
                                                            Theme.of(
                                                              context,
                                                            ).indicatorColor,
                                                      ),

                                                  borderColor:
                                                      Theme.of(
                                                        context,
                                                      ).colorScheme.surface,
                                                  icon: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        '',
                                                        style: AppFont.medium18
                                                            .copyWith(
                                                              color:
                                                                  Theme.of(
                                                                    context,
                                                                  ).indicatorColor,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                  hintText: "0.0",
                                                ),
                                                Text(
                                                  "${roundDouble(chainFrom.balance ?? 0, 9)} ${chainFrom.symbol ?? ""}",
                                                  style: AppFont.reguler10
                                                      .copyWith(
                                                        color:
                                                            Theme.of(
                                                              context,
                                                            ).hintColor,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          width(8),
                                          Expanded(
                                            flex: 3,
                                            child: InkWell(
                                              onTap: () {
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder:
                                                      (context) =>
                                                          const SheetChangeChainSwap(
                                                            isFrom: true,
                                                          ),
                                                  backgroundColor:
                                                      Theme.of(
                                                        context,
                                                      ).colorScheme.surface,
                                                  showDragHandle: true,
                                                  isDismissible: false,
                                                  isScrollControlled: true,
                                                  // useSafeArea: true,
                                                  shape: const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.vertical(
                                                          top: Radius.circular(
                                                            16,
                                                          ),
                                                        ),
                                                  ),
                                                );
                                              },
                                              child: CardGeneral(
                                                radius: 4,
                                                margin: EdgeInsets.zero,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 8,
                                                    ),
                                                background:
                                                    Theme.of(context).cardColor,
                                                child:
                                                    chainFrom.id == null
                                                        ? Row(
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                "Select Token",
                                                                style: AppFont
                                                                    .medium12
                                                                    .copyWith(
                                                                      color:
                                                                          Theme.of(
                                                                            context,
                                                                          ).hintColor,
                                                                    ),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                            width(4),
                                                            const Icon(
                                                              Icons
                                                                  .arrow_drop_down_rounded,
                                                              size: 16,
                                                            ),
                                                          ],
                                                        )
                                                        : Row(
                                                          children: [
                                                            SizedBox(
                                                              width: 20,
                                                              height: 20,
                                                              child: Stack(
                                                                children: [
                                                                  ClipOval(
                                                                    child:
                                                                        chainFrom.logo ==
                                                                                null
                                                                            ? Image.asset(
                                                                              AppImage.logo,
                                                                              width:
                                                                                  20,
                                                                            )
                                                                            : chainFrom.logo!.contains(
                                                                              "assets/logo/",
                                                                            )
                                                                            ? Image.asset(
                                                                              chainFrom.logo ??
                                                                                  '',
                                                                              width:
                                                                                  20,
                                                                            )
                                                                            : Image.network(
                                                                              chainFrom.logo ??
                                                                                  '',
                                                                              width:
                                                                                  20,
                                                                            ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .bottomRight,
                                                                    child: Container(
                                                                      width: 14,
                                                                      height: 8,
                                                                      decoration: BoxDecoration(
                                                                        shape:
                                                                            BoxShape.circle,
                                                                        border: Border.all(
                                                                          width:
                                                                              1,
                                                                          color:
                                                                              Theme.of(
                                                                                context,
                                                                              ).cardColor,
                                                                        ),
                                                                        image: DecorationImage(
                                                                          image:
                                                                              chainFrom.logo ==
                                                                                      null
                                                                                  ? const AssetImage(
                                                                                    AppImage.logo,
                                                                                  )
                                                                                  : chainFrom.baseLogo!.contains(
                                                                                    "assets/logo/",
                                                                                  )
                                                                                  ? AssetImage(
                                                                                    chainFrom.baseLogo ??
                                                                                        '',
                                                                                  )
                                                                                  : NetworkImage(
                                                                                    chainFrom.baseLogo ??
                                                                                        '',
                                                                                  ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),

                                                            width(6),
                                                            Expanded(
                                                              child: Text(
                                                                chainFrom
                                                                        .symbol ??
                                                                    '',
                                                                style: AppFont
                                                                    .medium12
                                                                    .copyWith(
                                                                      color:
                                                                          Theme.of(
                                                                            context,
                                                                          ).indicatorColor,
                                                                    ),
                                                              ),
                                                            ),
                                                            width(2),
                                                            const Icon(
                                                              Icons
                                                                  .arrow_drop_down_rounded,
                                                              size: 16,
                                                            ),
                                                          ],
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Visibility(
                                  visible: validateFrom != '',
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child: Text(
                                      validateFrom,
                                      style: AppFont.reguler12.copyWith(
                                        color: AppColor.redColor,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ),
                                height(12),
                                Center(
                                  child: InkWell(
                                    onTap: () {
                                      var chain1 = chainFrom;
                                      var chain2 = chainTo;
                                      ref
                                          .read(chainSwapFromProvider.notifier)
                                          .setChain(chain2);
                                      ref
                                          .read(chainSwapToProvider.notifier)
                                          .setChain(chain1);
                                      ref.read(fromSwapAmountProvider).clear();
                                      ref.read(toSwapAmountProvider).clear();
                                      ref
                                          .read(priceImpactProvider.notifier)
                                          .setValue(0);
                                    },
                                    child: Icon(
                                      Icons.swap_vert,
                                      size: 44,
                                      color: AppColor.primaryColor,
                                    ),
                                  ),
                                ),
                                height(12),
                                CardGeneral(
                                  margin: EdgeInsets.zero,
                                  background:
                                      Theme.of(context).colorScheme.surface,
                                  border: Border.all(
                                    width: 0.2,
                                    color: Theme.of(context).canvasColor,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "To",
                                            style: AppFont.medium14.copyWith(
                                              color:
                                                  Theme.of(context).hintColor,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              ref
                                                  .read(
                                                    toSwapAmountProvider
                                                        .notifier,
                                                  )
                                                  .useBalanceMax();
                                            },
                                            child: Text(
                                              "Use Max",
                                              style: AppFont.medium14.copyWith(
                                                color:
                                                    Theme.of(
                                                      context,
                                                    ).indicatorColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      height(8),
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 6,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                InputText(
                                                  borderSide: BorderSide.none,
                                                  controller: ref.watch(
                                                    toSwapAmountProvider,
                                                  ),
                                                  onChange: (v) {
                                                    debounc.run(() {
                                                      ref
                                                          .read(
                                                            toSwapAmountProvider
                                                                .notifier,
                                                          )
                                                          .onChange(v);
                                                    });
                                                  },
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter.allow(
                                                      RegExp(r'^[0-9.]*'),
                                                    ),
                                                  ],
                                                  contentPadding:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 4,
                                                        vertical: 0,
                                                      ),
                                                  hintStyle: AppFont.medium18
                                                      .copyWith(
                                                        color:
                                                            Theme.of(
                                                              context,
                                                            ).hintColor,
                                                      ),
                                                  textStyle: AppFont.semibold18
                                                      .copyWith(
                                                        color:
                                                            Theme.of(
                                                              context,
                                                            ).indicatorColor,
                                                      ),

                                                  borderColor:
                                                      Theme.of(
                                                        context,
                                                      ).colorScheme.surface,
                                                  icon: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        '',
                                                        style: AppFont.medium18
                                                            .copyWith(
                                                              color:
                                                                  Theme.of(
                                                                    context,
                                                                  ).indicatorColor,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                  hintText: "0.0",
                                                ),
                                                Text(
                                                  "${roundDouble(chainTo.balance ?? 0, 9)} ${chainTo.symbol ?? ""}",
                                                  style: AppFont.reguler10
                                                      .copyWith(
                                                        color:
                                                            Theme.of(
                                                              context,
                                                            ).hintColor,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          width(8),
                                          Expanded(
                                            flex: 3,
                                            child: InkWell(
                                              onTap: () {
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder:
                                                      (context) =>
                                                          const SheetChangeChainSwap(
                                                            isFrom: false,
                                                          ),
                                                  backgroundColor:
                                                      Theme.of(
                                                        context,
                                                      ).colorScheme.surface,
                                                  showDragHandle: true,
                                                  isDismissible: false,
                                                  isScrollControlled: true,
                                                  // useSafeArea: true,
                                                  shape: const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.vertical(
                                                          top: Radius.circular(
                                                            16,
                                                          ),
                                                        ),
                                                  ),
                                                );
                                              },
                                              child: CardGeneral(
                                                radius: 4,
                                                margin: EdgeInsets.zero,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 8,
                                                    ),
                                                background:
                                                    Theme.of(context).cardColor,
                                                child:
                                                    chainTo.id == null
                                                        ? Row(
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                "Select Token",
                                                                style: AppFont
                                                                    .medium12
                                                                    .copyWith(
                                                                      color:
                                                                          Theme.of(
                                                                            context,
                                                                          ).hintColor,
                                                                    ),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                            width(4),
                                                            const Icon(
                                                              Icons
                                                                  .arrow_drop_down_rounded,
                                                              size: 16,
                                                            ),
                                                          ],
                                                        )
                                                        : Row(
                                                          children: [
                                                            SizedBox(
                                                              width: 20,
                                                              height: 20,
                                                              child: Stack(
                                                                children: [
                                                                  ClipOval(
                                                                    child:
                                                                        chainTo.logo ==
                                                                                null
                                                                            ? Image.asset(
                                                                              AppImage.logo,
                                                                              width:
                                                                                  20,
                                                                            )
                                                                            : chainTo.logo!.contains(
                                                                              "assets/logo/",
                                                                            )
                                                                            ? Image.asset(
                                                                              chainTo.logo ??
                                                                                  '',
                                                                              width:
                                                                                  20,
                                                                            )
                                                                            : Image.network(
                                                                              chainTo.logo ??
                                                                                  '',
                                                                              width:
                                                                                  20,
                                                                            ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .bottomRight,
                                                                    child: Container(
                                                                      width: 14,
                                                                      height: 8,
                                                                      decoration: BoxDecoration(
                                                                        shape:
                                                                            BoxShape.circle,
                                                                        border: Border.all(
                                                                          width:
                                                                              1,
                                                                          color:
                                                                              Theme.of(
                                                                                context,
                                                                              ).cardColor,
                                                                        ),
                                                                        image: DecorationImage(
                                                                          image:
                                                                              chainTo.logo ==
                                                                                      null
                                                                                  ? const AssetImage(
                                                                                    AppImage.logo,
                                                                                  )
                                                                                  : chainTo.baseLogo!.contains(
                                                                                    "assets/logo/",
                                                                                  )
                                                                                  ? AssetImage(
                                                                                    chainTo.baseLogo ??
                                                                                        '',
                                                                                  )
                                                                                  : NetworkImage(
                                                                                    chainTo.baseLogo ??
                                                                                        '',
                                                                                  ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),

                                                            width(6),
                                                            Expanded(
                                                              child: Text(
                                                                chainTo.symbol ??
                                                                    '',
                                                                style: AppFont
                                                                    .medium12
                                                                    .copyWith(
                                                                      color:
                                                                          Theme.of(
                                                                            context,
                                                                          ).indicatorColor,
                                                                    ),
                                                              ),
                                                            ),
                                                            width(2),
                                                            const Icon(
                                                              Icons
                                                                  .arrow_drop_down_rounded,
                                                              size: 16,
                                                            ),
                                                          ],
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                ref.watch(loadingPriceImpactProvider)
                                    ? ShimmerLoading(
                                      height: context.h(0.1),
                                      width: double.infinity,
                                    )
                                    : Visibility(
                                      visible:
                                          ref
                                                  .watch(fromSwapAmountProvider)
                                                  .text !=
                                              "" &&
                                          ref
                                                  .watch(toSwapAmountProvider)
                                                  .text !=
                                              "",
                                      child: CardGeneral(
                                        border: Border.all(
                                          width: 0.5,
                                          color: Theme.of(context).canvasColor,
                                        ),
                                        margin: EdgeInsets.only(top: 16),
                                        background:
                                            Theme.of(
                                              context,
                                            ).colorScheme.surface,
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Slippage",
                                                  style: AppFont.medium12
                                                      .copyWith(
                                                        color:
                                                            Theme.of(
                                                              context,
                                                            ).indicatorColor,
                                                      ),
                                                ),
                                                width(8),
                                                Expanded(
                                                  child: Text(
                                                    "${roundDouble((slippage * 100), 2)}%",
                                                    style: AppFont.medium12
                                                        .copyWith(
                                                          color:
                                                              Theme.of(
                                                                context,
                                                              ).indicatorColor,
                                                        ),
                                                    textAlign: TextAlign.end,
                                                  ),
                                                ),
                                              ],
                                            ),

                                            height(8),
                                            SizedBox(
                                              height: 1,
                                              child: Divider(
                                                thickness: 1,
                                                color:
                                                    Theme.of(
                                                      context,
                                                    ).canvasColor,
                                              ),
                                            ),
                                            height(8),
                                            Row(
                                              children: [
                                                Text(
                                                  "Price Impact",
                                                  style: AppFont.medium12
                                                      .copyWith(
                                                        color:
                                                            Theme.of(
                                                              context,
                                                            ).indicatorColor,
                                                      ),
                                                ),
                                                width(8),
                                                Expanded(
                                                  child: Text(
                                                    "${roundDouble(priceImpact, 2)}%",
                                                    style: AppFont.medium12
                                                        .copyWith(
                                                          color:
                                                              Theme.of(
                                                                context,
                                                              ).indicatorColor,
                                                        ),
                                                    textAlign: TextAlign.end,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                height(16),
                                ref.watch(loadingSwapProvider)
                                    ? ButtonLoading()
                                    : PrimaryButton(
                                      disable:
                                          ref.watch(disableSwapProvider) ||
                                          ref.watch(loadingPriceImpactProvider),
                                      disableColor:
                                          Theme.of(context).colorScheme.surface,
                                      title: "Swap",
                                      onPressed: () {
                                        ref
                                            .read(txHashSwapProvider.notifier)
                                            .swap(context);
                                      },
                                    ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
