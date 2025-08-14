import 'package:bee_wallet/presentation/provider/network/network_setting_provider.dart';
import 'package:bee_wallet/presentation/widget/input_text.dart';
import 'package:bee_wallet/presentation/widget/primary_button.dart';
import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditRpcNetwork extends ConsumerWidget {
  const EditRpcNetwork({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: WidgetHelper.appBar(context: context, title: "Edit Network"),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).cardColor,
          ),
          child: LayoutBuilder(
            builder:
                (context, constraints) => SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            InputText(
                              title: "Name",
                              controller: ref.watch(nameNetworkProvider),
                              enable: false,
                              hintText: "Input Network name ",
                              color: Theme.of(context).colorScheme.surface,
                            ),
                            height(16),
                            InputText(
                              title: "Symbol",
                              controller: ref.watch(symbolNetworkProvider),
                              enable: false,
                              hintText: "Input Network name ",
                              color: Theme.of(context).colorScheme.surface,
                            ),
                            height(16),
                            InputText(
                              title: "Chain Id",
                              controller: ref.watch(chainIdNetworkProvider),
                              enable: false,
                              hintText: "Input Network name ",
                              color: Theme.of(context).colorScheme.surface,
                            ),
                            height(16),
                            InputText(
                              title: "RPC",
                              controller: ref.watch(rpcNetworkProvider),
                              enable: ref.watch(isEditProvider),
                              autoFocus: ref.watch(isEditProvider),
                              hintText: "Input Network name ",
                              color: Theme.of(context).colorScheme.surface,
                            ),
                            height(16),
                            InputText(
                              title: "Explorer",
                              controller: ref.watch(explorerNetworkProvider),
                              enable: false,
                              hintText: "Input Network name ",
                              color: Theme.of(context).colorScheme.surface,
                            ),
                            height(24),
                          ],
                        ),
                        PrimaryButton(
                          title:
                              ref.watch(isEditProvider) == true
                                  ? "Save"
                                  : "Edit",
                          onPressed: () {
                            if (ref.watch(isEditProvider) == true) {
                              ref
                                  .watch(
                                    selectedNetworkSettingProvider.notifier,
                                  )
                                  .updateRPC(
                                    context: context,
                                    rpc: ref.watch(rpcNetworkProvider).text,
                                  );
                            } else {
                              ref
                                  .read(isEditProvider.notifier)
                                  .changeEdit(true);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
