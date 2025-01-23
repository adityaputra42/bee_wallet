import 'package:bee_wallet/presentation/provider/network/network_setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/config.dart';
import '../../../../../data/model/token_chain/token_chain.dart';
import '../../../../../data/src/src.dart';
import '../../../../../utils/util.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            height(16),
            SearchField(
                controller: ref.watch(searchNetworkSetting),
                onChange: (v) => ref
                    .read(listNetworkSettingProvider.notifier)
                    .onSearch(ref.watch(searchNetworkSetting).text)),
            height(16),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).cardColor),
              child: listChain.isEmpty
                  ? const Empty(title: "Chain Not Found")
                  : ListView.builder(
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: cardChain(context, listChain[index], ref),
                      ),
                      itemCount: listChain.length,
                    ),
            )),
            height(16),
          ],
        ),
      ),
    );
  }

  Widget cardChain(BuildContext context, TokenChain chain, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(selectedNetworkSettingProvider.notifier).setToken(chain);
        ref.watch(selectedNetworkSettingProvider);
        context.goNamed('edit_rpc_network');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                width: 1, color: Theme.of(context).colorScheme.surface),
            color: Theme.of(context).colorScheme.surface),
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
                      child: (chain.logo != null)
                          ? Image.asset(
                              chain.logo!,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(AppImage.logo),
                    ),
                  ),
                ),
                width(8),
                Expanded(
                  child: Text(
                    chain.name ?? '',
                    style: AppFont.medium14
                        .copyWith(color: Theme.of(context).indicatorColor),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                width(8),
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
