// ignore_for_file: unused_result

import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/mdi.dart';

import '../../../../../config/config.dart';
import '../../../../../data/src/src.dart';
import '../../../../provider/dapp/browser_provider.dart';
import '../../../../widget/card_general.dart';
import '../../../../widget/empty.dart';
import '../../../../widget/error.dart';

import '../../../../widget/shimmer_loading.dart';
import 'new_dapps.dart';

class AllHistoryDappScreen extends ConsumerWidget {
  const AllHistoryDappScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: WidgetHelper.appBar(context: context, title: "History Browser"),
      body: CardGeneral(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "History",
              style: AppFont.medium14
                  .copyWith(color: Theme.of(context).indicatorColor),
            ),
            height(16),
            Expanded(
                child: ref.watch(browserHistoryProvider).when(
              data: (data) {
                return data.isEmpty
                    ? const Empty(title: "No Data")
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          return CardGeneral(
                            background: Theme.of(context).colorScheme.surface,
                            margin: const EdgeInsets.only(bottom: 8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  NewWeb3Webview(
                                                      initialUrl:
                                                          data[index].url ??
                                                              '')));
                                    },
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          AppImage.logo,
                                          width: 42,
                                        ),
                                        width(8),
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data[index].title ?? "",
                                              style: AppFont.medium14.copyWith(
                                                  color: Theme.of(context)
                                                      .indicatorColor),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            height(2),
                                            Text(
                                              data[index].url ?? "",
                                              style: AppFont.reguler12.copyWith(
                                                  color: Theme.of(context)
                                                      .hintColor),
                                              overflow: TextOverflow.ellipsis,
                                            )
                                          ],
                                        )),
                                      ],
                                    ),
                                  ),
                                ),
                                width(8),
                                InkWell(
                                  onTap: () {
                                    ref
                                        .read(browserHistoryProvider.notifier)
                                        .deleteDappsHistory(data[index].id!);
                                  },
                                  child: const Iconify(
                                    Mdi.delete_outline,
                                    size: 24,
                                    color: AppColor.yellowColor,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        itemCount: data.length,
                      );
              },
              error: (Object error, StackTrace stackTrace) {
                return ErrorView(
                  ontap: () {
                    ref.refresh(browserHistoryProvider);
                  },
                );
              },
              loading: () {
                return ListView.builder(
                  itemBuilder: (context, index) => const ShimmerLoading(
                    height: 54,
                  ),
                  itemCount: 10,
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
