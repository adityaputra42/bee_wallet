

import '../../../../utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/config.dart';
import '../../../provider/provider.dart';
import '../../../widget/widget.dart';

final indexTabImport = StateProvider<int>((ref) => 0);

class ImportAccountScreen extends ConsumerWidget {
  const ImportAccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indexTab = ref.watch(indexTabImport);
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: WidgetHelper.appBar(context: context, title: "Import Wallet"),
        //       body: Container(
        //         width: double.infinity,
        //         height: ScreenUtil().screenHeight,
        //         margin: EdgeInsets.all(16.w),
        //         padding: EdgeInsets.all(16.w),
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(12.r),
        //             color: Theme.of(context).cardColor),
        //         child: DefaultTabController(
        //           length: 4,
        //           initialIndex: indexTab,
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Container(
        //                 width: double.infinity,
        //                 height: 48.h,
        //                 decoration: BoxDecoration(
        //                   borderRadius: BorderRadius.circular(12.r),
        //                   color: Theme.of(context).colorScheme.background,
        //                 ),
        //                 child: TabBar(
        //                   automaticIndicatorColorAdjustment: false,
        //                   indicator: BoxDecoration(
        //                       gradient: AppColor.primaryGradient,
        //                       borderRadius: BorderRadius.horizontal(
        //                           left: indexTab == 0
        //                               ? Radius.circular(12.r)
        //                               : Radius.zero,
        //                           right: indexTab == 3
        //                               ? Radius.circular(12.r)
        //                               : Radius.zero)),
        //                   isScrollable: false,
        //                   dividerColor: Theme.of(context).cardColor,
        //                   indicatorColor: Theme.of(context).cardColor,
        //                   labelColor: AppColor.textStrongDark,
        //                   labelPadding: EdgeInsets.zero,
        //                   labelStyle: AppFont.reguler12,
        //                   unselectedLabelColor: AppColor.grayColor,
        //                   unselectedLabelStyle: AppFont.reguler12,
        //                   indicatorSize: TabBarIndicatorSize.tab,
        //                   onTap: (index) {
        //                     ref.read(indexTabImport.notifier).state = index;
        //                   },
        //                   tabs: [
        //                     Tab(
        //                       child: Container(
        //                         height: 48.w,
        //                         width: double.infinity,
        //                         decoration: BoxDecoration(
        //                             border: Border(
        //                           right: BorderSide(
        //                               width: 0.3.w, color: AppColor.grayColor),
        //                         )),
        //                         child: const Center(
        //                           child: Text(
        //                             "Seed",
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                     Tab(
        //                       child: Container(
        //                         height: 48.w,
        //                         width: double.infinity,
        //                         decoration: BoxDecoration(
        //                             border: Border(
        //                           right: BorderSide(
        //                               width: 0.3.w, color: AppColor.grayColor),
        //                         )),
        //                         child: const Center(
        //                           child: Text(
        //                             "Keystore",
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                     Tab(
        //                       child: Container(
        //                         height: 48.w,
        //                         width: double.infinity,
        //                         decoration: BoxDecoration(
        //                             border: Border(
        //                           right: BorderSide(
        //                               width: 0.3.w, color: AppColor.grayColor),
        //                         )),
        //                         child: const Center(
        //                           child: Text(
        //                             "Private Key",
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                     Tab(
        //                       child: SizedBox(
        //                         height: 48.w,
        //                         width: double.infinity,
        //                         child: const Center(
        //                           child: Text(
        //                             "Private Key",
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //               16.0.height,
        //               Expanded(
        //                   child: TabBarView(children: [
        //                 seedPharse(context, ref),
        //                 keystore(context),
        //                 privateKey(context, ref),
        //                 watchWallet(context),
        //               ]))
        //             ],
        //           ),
        //         ),
        //       ));
        // }

        body: Container(
          width: double.infinity,
          height: ScreenUtil().screenHeight,
          margin: EdgeInsets.all(16.w),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: Theme.of(context).cardColor),
          child: DefaultTabController(
            length: 2,
            initialIndex: indexTab,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 54.h,
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: Theme.of(context).colorScheme.background,
                  ),
                  child: TabBar(
                    automaticIndicatorColorAdjustment: false,
                    indicator: BoxDecoration(
                        gradient: AppColor.primaryGradient,
                        borderRadius: BorderRadius.circular(10.r)
                        // borderRadius: BorderRadius.horizontal(
                        //     left: indexTab == 0
                        //         ? Radius.circular(12.r)
                        //         : Radius.zero,
                        //     right: indexTab == 1
                        //         ? Radius.circular(12.r)
                        //         : Radius.zero),
                        ),
                    isScrollable: false,
                    dividerColor: Theme.of(context).cardColor,
                    indicatorColor: Theme.of(context).cardColor,
                    // dividerColor: AppColor.primaryColor,
                    // indicatorColor: AppColor.primaryColor,
                    labelColor: AppColor.textStrongDark,
                    labelPadding: EdgeInsets.zero,
                    labelStyle: AppFont.medium14,
                    unselectedLabelColor: AppColor.grayColor,
                    unselectedLabelStyle: AppFont.reguler14,
                    indicatorSize: TabBarIndicatorSize.tab,
                    onTap: (index) {
                      ref.read(indexTabImport.notifier).state = index;
                    },
                    tabs: const [
                      Tab(
                        child: Center(
                          child: Text(
                            "Seed",
                          ),
                        ),
                      ),
                      Tab(
                        child: Center(
                          child: Text(
                            "Private Key",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                16.0.height,
                Expanded(
                    child: TabBarView(children: [
                  seedPharse(context, ref),
                  privateKey(context, ref),
                ]))
              ],
            ),
          ),
        ));
  }

  Column seedPharse(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        InputText(
          title: "Seed Phrase",
          crossTitle: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const ScannPage(
              //                   type: ScanType.importMnemonic,
              //                 )));
              //   },
              //   child: Image.asset(
              //     AppIcon.scan,
              //     width: 24.w,
              //   ),
              // ),
              // 8.0.width,
              // GestureDetector(
              //   onTap: () {
              //     MethodHelper()
              //         .pasteFromClipboard(ref.watch(pharseControllerProvider));
              //     ref.read(disableImportProvider.notifier).validateButton();
              //   },
              //   child: Image.asset(
              //     AppIcon.paste,
              //     width: 24.w,
              //   ),
              // ),
            ],
          ),
          hintText: "Type your recovery phrase",
          color: Theme.of(context).colorScheme.background,
          controller: ref.watch(pharseControllerProvider),
          onChange: (v) {
            ref.read(disableImportProvider.notifier).validateButton();
          },
          maxLine: 5,
        ),
        const Spacer(),
        Text(
          "if your seed phrase is not in English, Please convert it to English First",
          style: AppFont.reguler12.copyWith(color: Theme.of(context).hintColor),
          textAlign: TextAlign.center,
        ),
        16.0.height,
        PrimaryButton(
          title: "Import",
          loading: ref.watch(loadingImportProvider),
          disable: ref.watch(disableImportProvider),
          onPressed: () {
            if (WalletHelper()
                .validateMnemonic(ref.watch(pharseControllerProvider).text)) {
              ref.read(importAccountProvider.notifier).import(context);
            } else {
              MethodHelper().showSnack(
                  context: context,
                  content: 'Seed Pharse is a invalid',
                  backgorund: AppColor.redColor);
            }
          },
        )
      ],
    );
  }

  Column keystore(BuildContext context) {
    return Column(
      children: [
        InputText(
          title: "Keystore JSON",
          hintText: "Type your keystore JSON",
          color: Theme.of(context).colorScheme.background,
          maxLine: 5,
        ),
        16.0.height,
        InputText(
          crossTitle: Text(
            "Paste",
            style: AppFont.medium14.copyWith(color: AppColor.primaryColor),
          ),
          hintText: 'Type your recovery phrase',
          color: Theme.of(context).colorScheme.background,
          icon: Icon(
            Icons.visibility_outlined,
            size: 20.w,
          ),
        ),
        const Spacer(),
        PrimaryButton(title: "Import", onPressed: () {}),
        16.0.height,
        SecondaryButton(
            title: "Import from iCloud/Dropboc/Google Drive", onPressed: () {})
      ],
    );
  }

  Column privateKey(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        InputText(
          title: "Private Key",
          crossTitle: GestureDetector(
            onTap: () {
              MethodHelper()
                  .pasteFromClipboard(ref.watch(privateKeyControllerProvider));
            },
            child: Text(
              "Paste",
              style: AppFont.medium14.copyWith(color: AppColor.primaryColor),
            ),
          ),
          hintText: "Type your private Key",
          controller: ref.watch(privateKeyControllerProvider),
          color: Theme.of(context).colorScheme.background,
          maxLine: 5,
        ),
        const Spacer(),
        PrimaryButton(
            title: "Import",
            onPressed: () {
              if (EthHelper().validatePrivateKey(
                  ref.watch(privateKeyControllerProvider).text)) {
                ref
                    .read(importAccountProvider.notifier)
                    .importByPrivateKey(context);
              } else {
                MethodHelper().showSnack(
                    context: context,
                    content: 'Private key is a invalid',
                    backgorund: AppColor.redColor);
              }
            })
      ],
    );
  }

  Column watchWallet(BuildContext context) {
    return Column(
      children: [
        InputText(
          title: "Ethereum address or ENS Name",
          crossTitle: Text(
            "Paste",
            style: AppFont.medium14.copyWith(color: AppColor.primaryColor),
          ),
          hintText: "Ethereum address or ENS Name",
          color: Theme.of(context).colorScheme.background,
        ),
        const Spacer(),
        PrimaryButton(title: "Import", onPressed: () {})
      ],
    );
  }
}
