import 'package:bee_wallet/presentation/screens/dashboard/home/changeAccount/change_account_screen.dart';
import 'package:blockies_ethereum/blockies_ethereum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/ant_design.dart';
import 'package:iconify_flutter_plus/icons/ic.dart';
import '../../../../config/config.dart';
import '../../../../utils/util.dart';
import '../../../provider/account/account_provider.dart';
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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 72.h,
          elevation: 0,
          title: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 48.w,
                  height: 48.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(width: 1.w, color: AppColor.primaryColor)),
                  child: Center(
                    child: Blockies(
                        size: 0.66.w,
                        data: account?.addressETH ?? '-',
                        shape: BlockiesShape.circle),
                  ),
                ),
                12.0.width,
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => const ChangeAccountScreen(),
                          backgroundColor:
                              Theme.of(context).colorScheme.background,
                          showDragHandle: true,
                          isDismissible: false,
                          isScrollControlled: true,
                          useSafeArea: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16.r))));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              account?.name ?? '',
                              style: AppFont.semibold14.copyWith(
                                color: Theme.of(context).indicatorColor,
                              ),
                            ),
                            4.0.width,
                            Iconify(
                              Ic.round_expand_more,
                              size: 24.w,
                              color: Theme.of(context).indicatorColor,
                            )
                          ],
                        ),
                        2.0.height,
                        Text(
                          'EVM : ${MethodHelper().shortAddress(address: account?.addressETH ?? '', length: 5)}',
                          style: AppFont.reguler12.copyWith(
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 36.w,
                      height: 36.w,
                      padding: EdgeInsets.all(6.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                              width: 1.w, color: AppColor.grayColor)),
                      child: Iconify(
                        AntDesign.scan,
                        color: Theme.of(context).indicatorColor,
                        size: 20.w,
                      ),
                    ))
              ],
            ),
          ),
        ),
        body: DefaultTabController(
          length: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              12.0.height,
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24.w),
                width: double.infinity,
                height: 48.h,
                padding: EdgeInsets.all(3.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: Theme.of(context).cardColor,
                ),
                child: TabBar(
                  physics: const NeverScrollableScrollPhysics(),
                  automaticIndicatorColorAdjustment: false,
                  indicator: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(5.r)),
                  isScrollable: false,
                  dividerColor: Theme.of(context).colorScheme.background,
                  indicatorColor: Theme.of(context).colorScheme.background,
                  labelColor: AppColor.textStrongLight,
                  labelPadding: EdgeInsets.zero,
                  labelStyle: AppFont.medium16,
                  unselectedLabelColor: AppColor.grayColor,
                  unselectedLabelStyle: AppFont.reguler16,
                  indicatorSize: TabBarIndicatorSize.tab,
                  onTap: (index) {},
                  tabs: const [
                    Tab(
                      child: Text(
                        "Coin",
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
              16.0.height,
              const Expanded(
                  child: TabBarView(children: [
                AssetWallet(),
                ListNft(),
              ]))
            ],
          ),
        ));
  }
}
