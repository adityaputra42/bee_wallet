import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bee_wallet/data/model/token_chain/token_chain.dart';
import 'package:bee_wallet/presentation/provider/provider.dart';
import 'package:bee_wallet/presentation/widget/widget.dart';
import 'package:bee_wallet/utils/util.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/material_symbols.dart';

import '../../../../../config/theme/theme.dart';
import '../../../../../data/src/src.dart';

final searchListChain = StateProvider.autoDispose<TextEditingController>(
  (ref) => TextEditingController(),
);

class SelectNetworkScreen extends ConsumerWidget {
  const SelectNetworkScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listChain = ref.watch(listChainSearchProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: WidgetHelper.appBar(context: context, title: "Change Network"),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              height(16),
              Row(
                children: [
                  Expanded(
                    child: SearchField(
                      controller: ref.watch(searchListChain),
                      onChange:
                          (v) => ref
                              .read(listChainSearchProvider.notifier)
                              .onSearch(ref.watch(searchListChain).text),
                    ),
                  ),
                  width(12),
                  GestureDetector(
                    onTap: () {
                      context.goNamed("add_network");
                    },
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).cardColor,
                      ),
                      child: Icon(
                        Icons.add_rounded,
                        size: 32,
                        color: Theme.of(context).indicatorColor,
                      ),
                    ),
                  ),
                ],
              ),
              height(16),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).cardColor,
                  ),
                  child:
                      listChain.isEmpty
                          ? const Empty(title: "Chain Not Found")
                          : ListView(
                            children: [
                              cardSelectAll(context, ref),
                              height(8),
                              Column(
                                children: List.generate(
                                  listChain.length,
                                  (index) => Padding(
                                    padding: EdgeInsets.only(bottom: 8),
                                    child: cardChain(
                                      context,
                                      listChain[index],
                                      ref,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                ),
              ),
              height(16),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardSelectAll(BuildContext context, WidgetRef ref) {
    final listchain =
        (ref.watch(listTokenChainProvider).valueOrNull ?? [])
            .where((e) => e.contractAddress == null)
            .toList();
    final selectedChain =
        (ref.watch(selectedChainTokenProvider).valueOrNull ?? [])
            .where((e) => e.contractAddress == null)
            .toList();
    return GestureDetector(
      onTap: () {
        ref.read(selectedChainTokenProvider.notifier).changeNework(isAll: true);
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1,
            color:
                selectedChain.length == listchain.length
                    ? AppColor.primaryColor
                    : Theme.of(context).colorScheme.surface,
          ),
          color: Theme.of(context).colorScheme.surface,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Iconify(
                  MaterialSymbols.widgets_outline_rounded,
                  size: 32,
                  color: AppColor.grayColor,
                ),
                width(8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "All",
                        style: AppFont.medium14.copyWith(
                          color: Theme.of(context).indicatorColor,
                        ),
                      ),
                      Text(
                        "Select all added network",
                        style: AppFont.reguler12.copyWith(
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget cardChain(BuildContext context, TokenChain chain, WidgetRef ref) {
    final selectedChain =
        (ref.watch(selectedChainTokenProvider).valueOrNull ?? []);
    final listTokenChain =
        (ref.watch(listTokenChainProvider).valueOrNull ?? []);

    return GestureDetector(
      onTap: () {
        ref
            .read(selectedChainTokenProvider.notifier)
            .changeNework(
              isAll: false,
              network:
                  listTokenChain
                      .where((element) => element.chainId == chain.chainId)
                      .toList()
                      .first,
            );
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1,
            color:
                listTokenChain.length != selectedChain.length &&
                        selectedChain.any(
                          (element) => element.chainId == chain.chainId,
                        )
                    ? AppColor.primaryColor
                    : Theme.of(context).colorScheme.surface,
          ),
          color: Theme.of(context).colorScheme.surface,
        ),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 32,
                  height: 32,
                  child: ClipPolygon(
                    sides: 6,
                    child: Container(
                      padding: EdgeInsets.all(0.5),
                      color: Theme.of(context).colorScheme.surface,
                      child:
                          (chain.logo != null)
                              ? Image.asset(chain.logo!, fit: BoxFit.cover)
                              : Image.asset(AppImage.logo),
                    ),
                  ),
                ),
                width(8),
                Expanded(
                  child: Text(
                    chain.name ?? '',
                    style: AppFont.medium14.copyWith(
                      color: Theme.of(context).indicatorColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                width(8),
                Text(
                  chain.symbol ?? '',
                  style: AppFont.medium14.copyWith(
                    color: Theme.of(context).hintColor,
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
