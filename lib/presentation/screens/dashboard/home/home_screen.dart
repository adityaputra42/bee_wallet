import 'package:bee_wallet/presentation/screens/dashboard/home/changeAccount/change_account_screen.dart';
import 'package:blockies_ethereum/blockies_ethereum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
        backgroundColor: Theme.of(context).colorScheme.surface,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 72,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: AppColor.primaryColor)),
                child: Center(
                  child: Blockies(
                      size: 0.66,
                      data: account?.addressETH ?? '-',
                      shape: BlockiesShape.circle),
                ),
              ),
              width(12),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => const ChangeAccountScreen(),
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        showDragHandle: true,
                        isDismissible: false,
                        isScrollControlled: true,
                        useSafeArea: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16))));
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
                          width(4),
                          Iconify(
                            Ic.round_expand_more,
                            size: 24,
                            color: Theme.of(context).indicatorColor,
                          )
                        ],
                      ),
                      height(2),
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
              InkWell(
                  onTap: () {},
                  child: Container(
                    width: 36,
                    height: 36,
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border:
                            Border.all(width: 1, color: AppColor.grayColor)),
                    child: Iconify(
                      AntDesign.scan,
                      color: AppColor.primaryColor,
                      size: 20,
                    ),
                  ))
            ],
          ),
        ),
        body: DefaultTabController(
          length: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height(12),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                height: 48,
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).cardColor,
                ),
                child: TabBar(
                  physics: const NeverScrollableScrollPhysics(),
                  automaticIndicatorColorAdjustment: false,
                  indicator: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(5)),
                  isScrollable: false,
                  dividerColor: Theme.of(context).cardColor,
                  indicatorColor: Theme.of(context).colorScheme.surface,
                  labelColor: AppColor.lightText1,
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
              height(16),
              const Expanded(
                  child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                    AssetWallet(),
                    ListNft(),
                  ]))
            ],
          ),
        ));
  }
}
