// ignore_for_file: unused_result

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:bee_wallet/data/model/chain_network/chain_network.dart';
import 'package:bee_wallet/presentation/provider/provider.dart';
import 'package:bee_wallet/presentation/widget/widget.dart';
import 'package:bee_wallet/utils/util.dart';

import '../../../../../config/theme/theme.dart';
import 'sheet_password_add_network.dart';

class AddNetwork extends ConsumerWidget {
  const AddNetwork({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: WidgetHelper.appBar(
          context: context,
          title: 'Add Network',
          icon: GestureDetector(
            onTap: () {
              context.goNamed('add_custom_network');
            },
            child: Container(
              width: 36.w,
              height: 36.w,
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(width: 1.w, color: AppColor.grayColor)),
              child: Icon(
                Icons.add_rounded,
                color: AppColor.primaryColor,
                size: 24.w,
              ),
            ),
          )),
      // bottomNavigationBar: PrimaryButton(
      //     margin: EdgeInsets.fromLTRB(24.w, 0, 24.w, 32.h),
      //     title: "Add Manually",
      //     onPressed: () {
      //       context.goNamed('add_custom_network');
      //     }),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Column(
          children: [
            SearchField(
              onChange: (v) =>
                  ref.read(chainOtherSearchProvider.notifier).onSearch(v),
            ),
            16.0.height,
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Theme.of(context).cardColor),
                child: ref.watch(chainOtherProvider).when(
                  data: (data) {
                    final listChain = ref.watch(chainOtherSearchProvider);
                    return listChain.isEmpty
                        ? const Empty(title: "Network not found")
                        : ListView.builder(
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.only(bottom: 8.h),
                              child: cardChain(context, listChain[index], ref),
                            ),
                            itemCount: listChain.length,
                          );
                  },
                  error: (Object error, StackTrace stackTrace) {
                    return ErrorView(
                      error: error.toString(),
                      ontap: () {
                        ref.refresh(chainOtherProvider);
                      },
                    );
                  },
                  loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardChain(BuildContext context, ChainNetwork chain, WidgetRef ref) {
    final tokenChainOrigin =
        ref.watch(tokenChainOriginProvider).valueOrNull ?? [];
    return GestureDetector(
      onTap: () {
        if (tokenChainOrigin
            .any((element) => element.chainId == chain.chainId)) {
          ref.read(chainOtherProvider.notifier).deleteTokenChain(chain);
        } else {
          showModalBottomSheet(
              context: context,
              builder: (context) => SheetPasswordAddNetwork(
                    chain: chain,
                  ),
              backgroundColor: Theme.of(context).colorScheme.background,
              isScrollControlled: true,
              showDragHandle: true,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(16.r))));
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: Theme.of(context).colorScheme.background),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chain.name ?? "",
                        style: AppFont.medium14
                            .copyWith(color: Theme.of(context).indicatorColor),
                      ),
                      2.0.height,
                      Text(
                        "Default Token: ${chain.symbol} | Chain ID: ${chain.chainId}",
                        style: AppFont.reguler12
                            .copyWith(color: Theme.of(context).hintColor),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 18.w,
                  height: 18.w,
                  padding: EdgeInsets.all(2.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.r),
                      color: tokenChainOrigin.any(
                              (element) => element.chainId == chain.chainId)
                          ? AppColor.redColor
                          : AppColor.primaryColor),
                  child: Icon(
                    tokenChainOrigin
                            .any((element) => element.chainId == chain.chainId)
                        ? Icons.remove_rounded
                        : Icons.add_rounded,
                    color: AppColor.textStrongDark,
                    size: 14.w,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
