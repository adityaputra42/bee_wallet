import 'package:bee_wallet/config/config.dart';
import 'package:bee_wallet/data/src/app_chain_logo.dart';
import 'package:bee_wallet/presentation/widget/widget.dart';
import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/material_symbols.dart';
import 'package:iconify_flutter_plus/icons/mdi.dart';
import 'package:iconify_flutter_plus/icons/ic.dart';

class SwapScreen extends ConsumerWidget {
  const SwapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: WidgetHelper.appBar(
          context: context, title: "Swap", isCanBack: false),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).cardColor),
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                children: [
                  SizedBox(
                    height: context.h(0.36),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.fromLTRB(16, 16, 16, 32),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color:
                                        Theme.of(context).colorScheme.surface),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "From :",
                                          style: AppFont.reguler12.copyWith(
                                              color:
                                                  Theme.of(context).hintColor),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Iconify(
                                              Mdi.wallet_outline,
                                              color:
                                                  Theme.of(context).hintColor,
                                              size: 16,
                                            ),
                                            width(8),
                                            Text(
                                              "0.00",
                                              style: AppFont.medium12.copyWith(
                                                  color: Theme.of(context)
                                                      .hintColor),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    height(16),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.45,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 40,
                                                height: 40,
                                                child: ClipPolygon(
                                                  sides: 6,
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.all(0.5),
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .surface,
                                                    child: Image.asset(
                                                        AppChainLogo.bnb),
                                                  ),
                                                ),
                                              ),
                                              width(12),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "BNB",
                                                          style: AppFont
                                                              .medium14
                                                              .copyWith(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .indicatorColor),
                                                        ),
                                                        width(4),
                                                        Iconify(
                                                          Ic.expand_more,
                                                          size: 18,
                                                          color: Theme.of(
                                                                  context)
                                                              .indicatorColor,
                                                        )
                                                      ],
                                                    ),
                                                    Text(
                                                      "Binance Smart chain",
                                                      style: AppFont.reguler12
                                                          .copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .hintColor),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: TextField(
                                              style: AppFont.medium24.copyWith(
                                                  color: Theme.of(context)
                                                      .indicatorColor),
                                              keyboardType:
                                                  TextInputType.number,
                                              textAlign: TextAlign.end,
                                              onChanged: (value) {},
                                              decoration: InputDecoration(
                                                hintText: '0',
                                                contentPadding: EdgeInsets.zero,
                                                hintStyle: AppFont.medium24
                                                    .copyWith(
                                                        color: Theme.of(context)
                                                            .indicatorColor),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  borderSide: const BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0.5),
                                                ),
                                                disabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  borderSide: const BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0.5),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  borderSide: const BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0.5),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  borderSide: const BorderSide(
                                                      color:
                                                          Colors.transparent),
                                                ),
                                              )),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            height(8),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.fromLTRB(16, 24, 16, 16),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color:
                                        Theme.of(context).colorScheme.surface),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "To :",
                                          style: AppFont.reguler12.copyWith(
                                              color:
                                                  Theme.of(context).hintColor),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Iconify(
                                              Mdi.wallet_outline,
                                              color:
                                                  Theme.of(context).hintColor,
                                              size: 16,
                                            ),
                                            width(8),
                                            Text(
                                              "0.00",
                                              style: AppFont.medium12.copyWith(
                                                  color: Theme.of(context)
                                                      .hintColor),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    height(16),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.45,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 40,
                                                height: 40,
                                                child: ClipPolygon(
                                                  sides: 6,
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.all(0.5),
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .surface,
                                                    child: Image.asset(
                                                        AppChainLogo.usdt),
                                                  ),
                                                ),
                                              ),
                                              width(12),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "USDT",
                                                          style: AppFont
                                                              .medium14
                                                              .copyWith(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .indicatorColor),
                                                        ),
                                                        width(4),
                                                        Iconify(
                                                          Ic.expand_more,
                                                          size: 18,
                                                          color: Theme.of(
                                                                  context)
                                                              .indicatorColor,
                                                        )
                                                      ],
                                                    ),
                                                    Text(
                                                      "Theter USD",
                                                      style: AppFont.reguler12
                                                          .copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .hintColor),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: TextField(
                                              style: AppFont.medium24.copyWith(
                                                  color: Theme.of(context)
                                                      .indicatorColor),
                                              keyboardType:
                                                  TextInputType.number,
                                              textAlign: TextAlign.end,
                                              onChanged: (value) {},
                                              decoration: InputDecoration(
                                                hintText: '0',
                                                contentPadding: EdgeInsets.zero,
                                                hintStyle: AppFont.medium24
                                                    .copyWith(
                                                        color: Theme.of(context)
                                                            .indicatorColor),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  borderSide: const BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0.5),
                                                ),
                                                disabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  borderSide: const BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0.5),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  borderSide: const BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0.5),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  borderSide: const BorderSide(
                                                      color:
                                                          Colors.transparent),
                                                ),
                                              )),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 52,
                            height: 52,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.primaryColor,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10,
                                      spreadRadius: 5,
                                      color: Theme.of(context)
                                          .indicatorColor
                                          .withValues(alpha: 0.1))
                                ]),
                            child: Iconify(
                              MaterialSymbols.swap_vert_rounded,
                              size: 24,
                              color: AppColor.lightText1,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  height(16),
                  PrimaryButton(title: "Swap", onPressed: () {}),
                  height(16),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).colorScheme.surface),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Provider',
                              style: AppFont.reguler12
                                  .copyWith(color: Theme.of(context).hintColor),
                            ),
                            Row(
                              children: [
                                Text(
                                  '1Inch',
                                  style: AppFont.medium12.copyWith(
                                      color: Theme.of(context).indicatorColor),
                                ),
                                width(4),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 16,
                                  color: Theme.of(context).indicatorColor,
                                )
                              ],
                            )
                          ],
                        ),
                        height(12),
                        SizedBox(
                          height: 1,
                          child: Divider(
                            thickness: 1,
                            color: AppColor.grayColor,
                          ),
                        ),
                        height(12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Rate',
                              style: AppFont.reguler12
                                  .copyWith(color: Theme.of(context).hintColor),
                            ),
                            Text(
                              '1 ETH = 2967.2783 USDT',
                              style: AppFont.medium12.copyWith(
                                  color: Theme.of(context).indicatorColor),
                            ),
                          ],
                        ),
                        height(8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Fee',
                              style: AppFont.reguler12
                                  .copyWith(color: Theme.of(context).hintColor),
                            ),
                            Text(
                              '0.25 %',
                              style: AppFont.medium12.copyWith(
                                  color: Theme.of(context).indicatorColor),
                            ),
                          ],
                        ),
                        height(8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Time',
                              style: AppFont.reguler12
                                  .copyWith(color: Theme.of(context).hintColor),
                            ),
                            Text(
                              '~ 10 min',
                              style: AppFont.medium12.copyWith(
                                  color: Theme.of(context).indicatorColor),
                            ),
                          ],
                        ),
                      ],
                    ),
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
