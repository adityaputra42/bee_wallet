// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:bee_wallet/data/src/app_chain_logo.dart';
import 'package:bee_wallet/utils/util.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/material_symbols.dart';
import '../../../../../config/config.dart';
import '../../../../../data/model/token_chain/selected_token_chain.dart';
import '../../../../../data/src/src.dart';
import '../../../../provider/provider.dart';
import '../../../../widget/widget.dart';

final searSelectedChain = StateProvider.autoDispose<TextEditingController>(
    (ref) => TextEditingController());

class AssetWallet extends ConsumerWidget {
  const AssetWallet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listChain = ref.watch(chainSelectedSearchProvider);
    final chain = ref.watch(selectedChainTokenProvider).valueOrNull ?? [];
    final chainList = (ref.watch(listTokenChainProvider).valueOrNull ?? []);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          height(8),
          Text(
            "\$${0.toStringAsFixed(2)}",
            style: AppFont.semibold30
                .copyWith(color: Theme.of(context).indicatorColor),
          ),
          height(2),
          Text(
            "Estimate Balance in USD",
            style:
                AppFont.medium12.copyWith(color: Theme.of(context).hintColor),
          ),
          height(16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: SearchField(
                controller: ref.watch(searSelectedChain),
                onChange: (v) {
                  ref.read(chainSelectedSearchProvider.notifier).onSearch(v);
                },
              )),
              width(8),
              GestureDetector(
                onTap: () {
                  context.goNamed('select_network');
                },
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    height: 48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).cardColor),
                    child: Row(
                      children: [
                        chainList.length != chain.length && chain.isNotEmpty
                            ? SizedBox(
                                width: 32,
                                height: 32,
                                child: ClipPolygon(
                                    sides: 6,
                                    child: Image.asset(
                                      chain.first.baseLogo ?? AppChainLogo.evm,
                                      fit: BoxFit.cover,
                                    )),
                              )
                            : Iconify(
                                MaterialSymbols.widgets_outline_rounded,
                                size: 24,
                                color: AppColor.grayColor,
                              ),
                        width(2),
                        Icon(Icons.expand_more,
                            size: 24, color: AppColor.grayColor)
                      ],
                    )),
              ),
              width(8),
              GestureDetector(
                onTap: () {
                  context.goNamed('manage_token');
                },
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).cardColor),
                  child: Icon(
                    Icons.tune,
                    size: 24,
                    color: AppColor.grayColor,
                  ),
                ),
              )
            ],
          ),
          height(16),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).cardColor),
            child: RefreshIndicator(
              onRefresh: () async {
                ref.refresh(selectedChainTokenProvider);
              },
              child: listChain.isEmpty
                  ? const Empty(title: "No Data")
                  : ListView.builder(
                      itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.only(bottom: 8),
                            child: cardChain(context, ref, listChain[index]),
                          ),
                      itemCount: listChain.length),
            ),
          )),
        ],
      ),
    );
  }

  Widget cardChain(
      BuildContext context, WidgetRef ref, SelectedTokenChain chain) {
    return GestureDetector(
      onTap: () {
        ref.read(chainDetailProvider.notifier).setChainDetail(chain);
        ref.watch(chainDetailProvider);
        context.goNamed('detail_token');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.surface),
        child: Row(
          children: [
            SizedBox(
              width: 34,
              height: 32,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: SizedBox(
                      width: 32,
                      height: 32,
                      child: ClipPolygon(
                        sides: 6,
                        child: Container(
                          padding: EdgeInsets.all(0.5),
                          color: Theme.of(context).colorScheme.surface,
                          child: (chain.logo != null)
                              ? Image.asset(chain.logo!)
                              : Image.asset(AppImage.logo),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: 16,
                      height: 16,
                      child: ClipPolygon(
                        sides: 6,
                        child: Container(
                            padding: EdgeInsets.all(0.1),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.1,
                                    color: Theme.of(context).primaryColor),
                                color: Theme.of(context).colorScheme.surface),
                            child:
                                Image.asset(chain.baseLogo ?? AppImage.logo)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            width(8),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "${chain.name}",
                        style: AppFont.semibold12
                            .copyWith(color: Theme.of(context).indicatorColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    width(16),
                    Text(
                      "${roundDouble((chain.balance ?? 0), 5)} ${chain.symbol}",
                      style: AppFont.medium12
                          .copyWith(color: Theme.of(context).indicatorColor),
                    ),
                  ],
                ),
                // height(2),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "${chain.symbol}",
                        style: AppFont.reguler10
                            .copyWith(color: Theme.of(context).hintColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    width(16),
                    Text(
                      "~\$ 0.0",
                      style: AppFont.medium10
                          .copyWith(color: Theme.of(context).hintColor),
                    ),
                  ],
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
