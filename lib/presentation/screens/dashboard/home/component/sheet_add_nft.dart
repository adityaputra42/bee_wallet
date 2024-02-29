import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          16.w, 0.h, 16.w, MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Add NFT ${chainToken.name}",
            style: AppFont.medium14
                .copyWith(color: Theme.of(context).indicatorColor),
          ),
          24.0.height,
          Warning(
              warning:
                  "Make sure you enter the correct information according to the ${chainToken.name} network."),
          16.0.height,
          InputText(
              controller: ref.watch(contractNftControllerProvider),
              onChange: (v) =>
                  ref.read(contractNftControllerProvider.notifier).onChange(v),
              validator: (v) => ref
                  .read(contractNftControllerProvider.notifier)
                  .onValidate(v),
              title: "Contract Address",
              hintText: "Enter your contract address"),
          16.0.height,
          InputText(
              controller: ref.watch(tokenIdControllerProvider),
              onChange: (v) =>
                  ref.read(tokenIdControllerProvider.notifier).onChange(v),
              validator: (v) =>
                  ref.read(tokenIdControllerProvider.notifier).onValidate(v),
              title: "Token Id",
              keyboardType: TextInputType.number,
              hintText: "Enter your token id"),
          24.0.height,
          PrimaryButton(
            disable: ref.watch(disableAddNftProvider),
            title: "Import",
            loading: ref.watch(loadingAddNftProvider),
            onPressed: () {
              ref.read(listNftProvider.notifier).addNft(
                  context,
                  ref.watch(contractNftControllerProvider).text,
                  int.parse(ref.watch(tokenIdControllerProvider).text));
            },
          ),
          24.0.height,
        ],
      ),
    );
  }
}
