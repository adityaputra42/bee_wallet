import 'package:bee_wallet/presentation/widget/button_loading.dart';
import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../config/config.dart';
import '../../../../provider/provider.dart';
import '../../../../widget/widget.dart';

class SheetAddNft extends ConsumerWidget {
  const SheetAddNft({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var chainToken = ref.watch(tokenChainNftProvider);
    return Padding(
      padding: EdgeInsets.fromLTRB(
        24,
        0,
        24,
        MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Add NFT ${chainToken.name}",
              style: AppFont.medium14.copyWith(
                color: Theme.of(context).indicatorColor,
              ),
            ),
            height(24),
            Warning(
              warning:
                  "Make sure you enter the correct information according to the ${chainToken.name} network.",
            ),
            height(16),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).cardColor,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InputText(
                    filled: true,
                    filledColor: Theme.of(context).colorScheme.surface,
                    controller: ref.watch(contractNftControllerProvider),
                    onChange:
                        (v) => ref
                            .read(contractNftControllerProvider.notifier)
                            .onChange(v),
                    validator:
                        (v) => ref
                            .read(contractNftControllerProvider.notifier)
                            .onValidate(v),
                    title: "Contract Address",
                    hintText: "Enter your contract address",
                  ),
                  height(16),
                  InputText(
                    filled: true,
                    filledColor: Theme.of(context).colorScheme.surface,
                    controller: ref.watch(tokenIdControllerProvider),
                    onChange:
                        (v) => ref
                            .read(tokenIdControllerProvider.notifier)
                            .onChange(v),
                    validator:
                        (v) => ref
                            .read(tokenIdControllerProvider.notifier)
                            .onValidate(v),
                    title: "Token Id",
                    keyboardType: TextInputType.number,
                    hintText: "Enter your token id",
                  ),
                  height(24),
                  ref.watch(loadingAddNftProvider)
                      ? ButtonLoading()
                      : PrimaryButton(
                        disable: ref.watch(disableAddNftProvider),
                        disableColor: Theme.of(context).colorScheme.surface,
                        title: "Import",
                        onPressed: () {
                          ref
                              .read(listNftProvider.notifier)
                              .addNft(
                                context,
                                ref.watch(contractNftControllerProvider).text,
                                int.parse(
                                  ref.watch(tokenIdControllerProvider).text,
                                ),
                              );
                        },
                      ),
                ],
              ),
            ),
            height(24),
          ],
        ),
      ),
    );
  }
}
