import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/config.dart';
import '../../../../../data/src/src.dart';
import '../../../../../utils/util.dart';
import '../../../../provider/account/account_provider.dart';
import '../../../../widget/widget.dart';

final seedImportController =
    StateProvider<TextEditingController>((ref) => TextEditingController());

final pKeyImportController =
    StateProvider<TextEditingController>((ref) => TextEditingController());

final indexImport = StateProvider<int>((ref) => 0);

class ImportWallet extends ConsumerWidget {
  const ImportWallet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indexTab = ref.watch(indexImport);
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: WidgetHelper.appBar(context: context, title: "Import Wallet"),
        // bottomNavigationBar: PrimaryButton(
        //   title: "Import Wallet",
        //   onPressed: () {},
        //   margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 36.h),
        // ),
//       body: Padding(
//         padding: EdgeInsets.all(16.w),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             16.0.height,
//             Text(
//               'Write down your Seed Phrase in order to import your wallet.',
//               style: AppFont.medium14
//                   .copyWith(color: Theme.of(context).indicatorColor),
//             ),
//             16.0.height,
//             Container(
//               padding: EdgeInsets.all(16.w),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8.r),
//                   color: Theme.of(context).cardColor),
//               child: InputText(
//                 title: "Seed Phrase",
//                 crossTitle: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     GestureDetector(
//                       onTap: () {},
//                       child: Image.asset(
//                         AppIcon.scan,
//                         width: 24.w,
//                       ),
//                     ),
//                     8.0.width,
//                     GestureDetector(
//                       onTap: () {
//                         MethodHelper().pasteFromClipboard(
//                             ref.watch(pharseImportController));
//                       },
//                       child: Image.asset(
//                         AppIcon.paste,
//                         width: 24.w,
//                       ),
//                     ),
//                   ],
//                 ),
//                 hintText: "Type your recovery phrase",
//                 color: Theme.of(context).colorScheme.background,
//                 controller: ref.watch(pharseImportController),
//                 onChange: (v) {},
//                 maxLine: 7,
//               ),
//             ),
//             16.0.height,
//             Text(
//               'Learn more about Seed Phrase Code.',
//               style: AppFont.medium12.copyWith(color: AppColor.primaryColor),
//             )
//           ],
//         ),
//       ),
//     );
//   }
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
                      ref.read(indexImport.notifier).state = index;
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
              GestureDetector(
                onTap: () {},
                child: Image.asset(
                  AppIcon.scan,
                  width: 24.w,
                ),
              ),
              8.0.width,
              GestureDetector(
                onTap: () {
                  MethodHelper()
                      .pasteFromClipboard(ref.watch(seedImportController));
                },
                child: Image.asset(
                  AppIcon.paste,
                  width: 24.w,
                ),
              ),
            ],
          ),
          hintText: "Type your recovery phrase",
          color: Theme.of(context).colorScheme.background,
          controller: ref.watch(seedImportController),
          onChange: (value) {
            ref.read(disableImportMnemonicProvider.notifier).validate(value);
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
          disable: ref.watch(disableImportMnemonicProvider),
          loading: ref.watch(loadingImportMnemonicProvider),
          onPressed: () {
            if (WalletHelper()
                .validateMnemonic(ref.watch(seedImportController).text)) {
              ref
                  .read(selectedAccountProvider.notifier)
                  .importByMnemonic(ref.watch(seedImportController).text);
              context.pop();
            } else {
              ref.watch(seedImportController).clear();
              MethodHelper().showSnack(
                  context: context,
                  content: 'Seed pharse is a invalid',
                  backgorund: AppColor.redColor);
            }
          },
        )
      ],
    );
  }

  Column privateKey(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        InputText(
          title: "Private Key",
          crossTitle: GestureDetector(
            onTap: () {},
            child: Text(
              "Paste",
              style: AppFont.medium14.copyWith(color: AppColor.primaryColor),
            ),
          ),
          hintText: "Type your private Key",
          color: Theme.of(context).colorScheme.background,
          controller: ref.watch(pKeyImportController),
          onChange: (value) {
            ref.read(disiableImportPrivateKeyProvider.notifier).validate(value);
          },
          maxLine: 5,
        ),
        const Spacer(),
        PrimaryButton(
            title: "Import",
            disable: ref.watch(disiableImportPrivateKeyProvider),
            loading: ref.watch(loadingImportPrivateKeyProvider),
            onPressed: () {
              if (EthHelper().validatePrivateKey(
                      ref.watch(pKeyImportController).text) ==
                  true) {
                ref
                    .read(selectedAccountProvider.notifier)
                    .importByPrivateKey(ref.watch(pKeyImportController).text);
              } else {
                ref.watch(pKeyImportController).clear();
                MethodHelper().showSnack(
                    context: context,
                    content: 'Private Key is a invalid',
                    backgorund: AppColor.redColor);
              }
            })
      ],
    );
  }
}
