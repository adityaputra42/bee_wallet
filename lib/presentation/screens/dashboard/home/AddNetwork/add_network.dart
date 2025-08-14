// ignore_for_file: unused_result
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: WidgetHelper.appBar(
        context: context,
        title: 'Add Network',
        icon: InkWell(
          onTap: () {
            context.goNamed('add_custom_network');
          },
          child: Container(
            width: 36,
            height: 36,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1, color: AppColor.grayColor),
            ),
            child: Icon(
              Icons.add_rounded,
              color: AppColor.primaryColor,
              size: 24,
            ),
          ),
        ),
      ),
      // bottomNavigationBar: PrimaryButton(
      //     margin: EdgeInsets.fromLTRB(24, 0, 24, 32.h),
      //     title: "Add Manually",
      //     onPressed: () {
      //       context.goNamed('add_custom_network');
      //     }),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SearchField(
                onChange:
                    (v) =>
                        ref.read(chainOtherSearchProvider.notifier).onSearch(v),
              ),
              height(16),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).cardColor,
                  ),
                  child: ref
                      .watch(chainOtherProvider)
                      .when(
                        data: (data) {
                          final listChain = ref.watch(chainOtherSearchProvider);
                          return listChain.isEmpty
                              ? const Empty(title: "Network not found")
                              : ListView.builder(
                                itemBuilder:
                                    (context, index) => Padding(
                                      padding: EdgeInsets.only(bottom: 8),
                                      child: cardChain(
                                        context,
                                        listChain[index],
                                        ref,
                                      ),
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
      ),
    );
  }

  Widget cardChain(BuildContext context, ChainNetwork chain, WidgetRef ref) {
    final tokenChainOrigin =
        ref.watch(tokenChainOriginProvider).valueOrNull ?? [];
    return GestureDetector(
      onTap: () {
        if (tokenChainOrigin.any(
          (element) => element.chainId == chain.chainId,
        )) {
          ref.read(chainOtherProvider.notifier).deleteTokenChain(chain);
        } else {
          showModalBottomSheet(
            context: context,
            builder: (context) => SheetPasswordAddNetwork(chain: chain),
            backgroundColor: Theme.of(context).colorScheme.surface,
            isScrollControlled: true,
            showDragHandle: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
          );
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.surface,
        ),
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
                        style: AppFont.medium14.copyWith(
                          color: Theme.of(context).indicatorColor,
                        ),
                      ),
                      height(2),
                      Text(
                        "Default Token: ${chain.symbol} | Chain ID: ${chain.chainId}",
                        style: AppFont.reguler12.copyWith(
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 18,
                  height: 18,
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color:
                        tokenChainOrigin.any(
                              (element) => element.chainId == chain.chainId,
                            )
                            ? AppColor.redColor
                            : AppColor.greenColor,
                  ),
                  child: Icon(
                    tokenChainOrigin.any(
                          (element) => element.chainId == chain.chainId,
                        )
                        ? Icons.remove_rounded
                        : Icons.add_rounded,
                    color: AppColor.darkText1,
                    size: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
