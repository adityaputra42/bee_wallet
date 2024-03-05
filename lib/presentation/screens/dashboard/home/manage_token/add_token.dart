import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bee_wallet/config/config.dart';
import 'package:bee_wallet/data/src/src.dart';
import 'package:bee_wallet/presentation/provider/tokenChain/token_chain_provider.dart';
import 'package:bee_wallet/utils/util.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/ant_design.dart';

import '../../../../../data/model/token_chain/token_chain.dart';
import '../../../../../data/src/app_chain_logo.dart';
import '../../../../widget/widget.dart';
import 'sheet_network_add_token.dart';

final indexTabTokenProvider = StateProvider<int>((ref) => 0);

class AddToken extends ConsumerWidget {
  AddToken({super.key});
  final DebouncerHelper debouncer = DebouncerHelper(milliseconds: 500);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chain = ref.watch(networkAddTokenProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: WidgetHelper.appBar(
        context: context,
        title: 'Add Custom Token',
        icon: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => const SheetNetworkAddToken(),
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
                  Icon(
                    Icons.arrow_drop_down_rounded,
                    color: Theme.of(context).hintColor,
                    size: 20.w,
                  ),
                ],
              ),
            )),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            // Container(
            //   padding: EdgeInsets.all(16.w),
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(8.r),
            //       color: Theme.of(context).cardColor),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         "Network",
            //         style: AppFont.medium14
            //             .copyWith(color: Theme.of(context).hintColor),
            //       ),
            //       GestureDetector(
            //         onTap: () {
            //           showModalBottomSheet(
            //               context: context,
            //               builder: (context) => const SheetNetworkAddToken(),
            //               backgroundColor:
            //                   Theme.of(context).colorScheme.background,
            //               showDragHandle: true,
            //               isDismissible: false,
            //               shape: RoundedRectangleBorder(
            //                   borderRadius: BorderRadius.vertical(
            //                       top: Radius.circular(16.r))));
            //         },
            //         child: Row(
            //           mainAxisSize: MainAxisSize.min,
            //           children: [
            //             SizedBox(
            //               width: 24.w,
            //               height: 24.w,
            //               child: ClipPolygon(
            //                 sides: 6,
            //                 child: Container(
            //                   padding: EdgeInsets.all(0.5.h),
            //                   color: Theme.of(context).colorScheme.background,
            //                   child: Image.asset(chain.logo ?? AppImage.logo),
            //                 ),
            //               ),
            //             ),
            //             8.0.width,
            //             Text(
            //               "${chain.symbol}",
            //               style: AppFont.medium14
            //                   .copyWith(color: Theme.of(context).hintColor),
            //             ),
            //             4.0.width,
            //             Icon(
            //               Icons.arrow_forward_ios_rounded,
            //               size: 12.w,
            //               color: Theme.of(context).hintColor,
            //             )
            //           ],
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            16.0.height,
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: Theme.of(context).cardColor),
                child: Column(
                  children: [
                    InputText(
                      title: "Contact Address",
                      icon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Iconify(
                            AntDesign.scan,
                            size: 24.w,
                            color: Theme.of(context).indicatorColor,
                          ),
                        ],
                      ),
                      controller: ref.watch(contractAddressProvider),
                      onChange: (value) {
                        debouncer.run(() {
                          ref
                              .read(contractAddressProvider.notifier)
                              .getTokenInfo(
                                  context: context,
                                  contractAddress: value,
                                  rpc: chain.rpc ?? '');
                        });
                      },
                      hintText: "Add Contract Address",
                      color: Theme.of(context).colorScheme.background,
                    ),
                    16.0.height,
                    InputText(
                      title: "Name",
                      hintText: "Add Name",
                      enable: false,
                      controller: ref.watch(nameTokenProvider),
                      color: Theme.of(context).colorScheme.background,
                    ),
                    16.0.height,
                    InputText(
                      title: "Symbol",
                      hintText: "Add Symbol",
                      controller: ref.watch(symbolTokenProvider),
                      enable: false,
                      color: Theme.of(context).colorScheme.background,
                    ),
                    16.0.height,
                    InputText(
                      title: "Decimals",
                      hintText: "Add Decimals",
                      controller: ref.watch(decimalTokenProvider),
                      enable: false,
                      color: Theme.of(context).colorScheme.background,
                    ),
                    const Spacer(),
                    PrimaryButton(
                        title: "Add",
                        onPressed: () {
                          ref.read(listManageTokenProvider.notifier).addToken(
                              context,
                              TokenChain(
                                  name: ref.watch(nameTokenProvider).text,
                                  contractAddress:
                                      ref.watch(contractAddressProvider).text,
                                  symbol: ref.watch(symbolTokenProvider).text,
                                  decimal: int.parse(
                                      ref.watch(decimalTokenProvider).text),
                                  balance: 0,
                                  baseLogo: chain.baseLogo,
                                  chainId: chain.chainId,
                                  logo: chain.chainId == '234'
                                      ? AppChainLogo.petaDefault
                                      : AppChainLogo.evm,
                                  explorer: chain.explorer,
                                  explorerApi: chain.explorerApi,
                                  baseChain: chain.baseChain,
                                  rpc: chain.rpc,
                                  isTestnet: null));
                        },
                        margin: EdgeInsets.only(top: 16.h)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
