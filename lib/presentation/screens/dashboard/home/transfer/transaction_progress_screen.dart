// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:bee_wallet/config/config.dart';
import 'package:bee_wallet/data/src/src.dart';
import 'package:bee_wallet/presentation/provider/provider.dart';
import 'package:bee_wallet/presentation/provider/transfer/transfer_provider.dart';
import 'package:bee_wallet/presentation/widget/widget.dart';

import '../../../../../utils/util.dart';

class TransactionProgressScreen extends ConsumerWidget {
  const TransactionProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chain = ref.watch(chainTransferProvider);
    final loading = ref.watch(transferChainProvider).isLoading;
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).colorScheme.surface),
          child: Column(
            children: [
              Text(
                loading == true
                    ? "Transaction In Progress"
                    : "Transaction Succes",
                style: AppFont.semibold16
                    .copyWith(color: Theme.of(context).indicatorColor),
              ),
              const Spacer(),
              Image.asset(
                AppImage.ilustrasi1,
                width: 284,
              ),
              height(36),
              Center(
                  child: loading == true
                      ? const CircularProgressIndicator()
                      : Icon(
                          Icons.check_circle_outline_rounded,
                          size: 60,
                          color: AppColor.secondaryColor,
                        )),
              height(24),
              Text(
                'The transaction is sent to the ${chain.name} Blockchain.\nIt might take few minutes to be confirmed by\nminers',
                style: AppFont.reguler12
                    .copyWith(color: Theme.of(context).hintColor),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              PrimaryButton(
                  disable: loading,
                  title: "Show History Transaction",
                  onPressed: () {
                    ref.read(balanceChainProvider.notifier).getBalance();
                    ref.watch(chainHistoryProvider).refresh();
                    ref.refresh(chainDetailProvider);
                    context.goNamed('detail_token');
                  })
            ],
          ),
        ),
      ),
    );
  }
}
