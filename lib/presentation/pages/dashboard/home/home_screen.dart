import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/config.dart';
import '../../../../utils/util.dart';
import '../../../provider/account/account_provider.dart';
import '../../../widget/widget.dart';
import 'changeAccount/change_account_screen.dart';
import 'component/asset_wallet.dart';
import 'component/list_nft.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(selectedAccountProvider).valueOrNull;
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        resizeToAvoidBottomInset: false,
        appBar: WidgetHelper.appBar(
            context: context,
            title: '${account?.name}',
            onTapTitle: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => const ChangeAccountScreen(),
                  backgroundColor: Theme.of(context).colorScheme.background,
                  showDragHandle: true,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16.r))));
            },
            iconTitle: Icon(
              Icons.expand_more_rounded,
              size: 24.w,
              color: Theme.of(context).indicatorColor,
            ),
            isCanBack: false,
            // icon: GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => const ScannPage(
            //                   type: ScanType.tranfersHome,
            //                 )));
            //   },
            //   child: Image.asset(
            //     AppIcon.scan,
            //     width: 24.w,
            //     color: Theme.of(context).indicatorColor,
            //   ),
            // )
            ),
        body: DefaultTabController(
          length: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                height: 48.h,
                child: TabBar(
                  automaticIndicatorColorAdjustment: false,
                  isScrollable: false,
                  dividerColor: AppColor.primaryColor,
                  indicatorColor: AppColor.primaryColor,
                  labelColor: Theme.of(context).indicatorColor,
                  labelPadding: EdgeInsets.zero,
                  labelStyle: AppFont.semibold14,
                  unselectedLabelColor: AppColor.grayColor,
                  unselectedLabelStyle: AppFont.medium14,
                  indicatorSize: TabBarIndicatorSize.tab,
                  onTap: (index) {},
                  tabs: const [
                    Tab(
                      child: Text(
                        "Assets",
                      ),
                    ),
                    Tab(
                      child: Text(
                        "DeFi",
                      ),
                    ),
                    Tab(
                      child: Text(
                        "NFT",
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: SizedBox(
                  height: 1.h,
                  child: Divider(
                    thickness: 1.h,
                    color: Theme.of(context).hintColor.withOpacity(0.2),
                  ),
                ),
              ),
              16.0.height,
              const Expanded(
                  child: TabBarView(children: [
                AssetWallet(),
                Empty(title: "No Data"),
                ListNft()
              ]))
            ],
          ),
        ));
  }
}
