import 'package:bee_wallet/presentation/provider/network/network_setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/config.dart';
import '../../../../../data/model/token_chain/token_chain.dart';
import '../../../../../data/src/src.dart';
import '../../../../../utils/util.dart';
import '../../../../provider/provider.dart';
import '../../../../widget/widget.dart';

final searchNetworkSetting = StateProvider.autoDispose<TextEditingController>(
    (ref) => TextEditingController());

class NetworkSetting extends ConsumerWidget {
  const NetworkSetting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listChain = ref.watch(listNetworkSettingProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: WidgetHelper.appBar(context: context, title: "Network Setting"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            16.0.height,
            SearchField(
                controller: ref.watch(searchNetworkSetting),
                onChange: (v) => ref
                    .read(listChainSearchProvider.notifier)
                    .onSearch(ref.watch(searchNetworkSetting).text)),
            16.0.height,
            Expanded(
                child: Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).cardColor),
              child: listChain.isEmpty
                  ? const Empty(title: "Chain Not Found")
                  : ListView.builder(
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(bottom: 8.h),
                        child: cardChain(context, listChain[index], ref),
                      ),
                      itemCount: listChain.length,
                    ),
            )),
            16.0.height,
          ],
        ),
      ),
    );
  }

  Widget cardChain(BuildContext context, TokenChain chain, WidgetRef ref) {
    // final selectedChain =
    //     (ref.watch(selectedChainTokenProvider).valueOrNull ?? []);
    // final listTokenChain =
    //     (ref.watch(listTokenChainProvider).valueOrNull ?? []);

    return GestureDetector(
      onTap: () {
        // ref.read(selectedChainTokenProvider.notifier).changeNework(
        //     isAll: false,
        //     network: listTokenChain
        //         .where((element) => element.chainId == chain.chainId)
        //         .toList()
        //         .first);
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
                width: 1.w, color: Theme.of(context).colorScheme.surface),
            color: Theme.of(context).colorScheme.surface),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 32.w,
                  height: 32.w,
                  child: ClipPolygon(
                    sides: 6,
                    child: Container(
                      padding: EdgeInsets.all(0.5.h),
                      color: Theme.of(context).colorScheme.surface,
                      child: (chain.logo != null)
                          ? Image.asset(
                              chain.logo!,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(AppImage.logo),
                    ),
                  ),
                ),
                8.0.width,
                Expanded(
                  child: Text(
                    chain.name ?? '',
                    style: AppFont.medium14
                        .copyWith(color: Theme.of(context).indicatorColor),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                8.0.width,
                Text(
                  chain.symbol ?? '',
                  style: AppFont.medium14
                      .copyWith(color: Theme.of(context).hintColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
