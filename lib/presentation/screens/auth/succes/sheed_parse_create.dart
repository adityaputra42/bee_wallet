import 'package:go_router/go_router.dart';

import '../../../../utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/config.dart';
import '../../../provider/backup/backup_provider.dart';
import '../../../widget/widget.dart';

class SheedPharseCreate extends ConsumerWidget {
  const SheedPharseCreate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mnemonic = ref.watch(parseMnemonicProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: WidgetHelper.appBar(
        context: context,
        title: "Back Up Pharse",
      ),
      bottomNavigationBar: PrimaryButton(
        title: 'Continue',
        onPressed: () {
          ref
              .read(randomMnemonicProvider.notifier)
              .setRandomMnemonic(ref.watch(parseMnemonicProvider));
          if (ref.watch(randomMnemonicProvider).isNotEmpty) {
            context.goNamed('confirm_parse_create');
          }
        },
        margin: EdgeInsets.only(bottom: 36, left: 16, right: 16),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height(16),
              Text(
                'Secret recovery phrase',
                style: AppFont.semibold18
                    .copyWith(color: Theme.of(context).indicatorColor),
              ),
              height(4),
              Text(
                'This 12-word phrase allows you to recover your wallet and access to the coins inside.',
                style: AppFont.reguler14
                    .copyWith(color: Theme.of(context).hintColor),
              ),
              height(16),
              Center(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2.6,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) => cardPniomoni(context,
                      number: mnemonic[index]['id'],
                      text: mnemonic[index]['data']),
                  itemCount: mnemonic.length,
                ),

                //  Wrap(
                //     crossAxisAlignment: WrapCrossAlignment.center,
                //     runAlignment: WrapAlignment.center,
                //     alignment: WrapAlignment.center,
                //     spacing: 8,
                //     runSpacing: 8,
                //     direction: Axis.horizontal,
                //     children: mnemonic
                //         .map(
                //           (e) => cardPniomoni(context,
                //               number: e['id'], text: e['data']),
                //         )
                //         .toList()),
              ),
              height(16),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardPniomoni(BuildContext context,
      {required int number, required String text}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 0.1,
                spreadRadius: 0.1,
                color: AppColor.grayColor.withValues(alpha: 0.15))
          ],
          borderRadius: BorderRadius.circular(4),
          color: Theme.of(context).cardColor),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text("$number. $text",
            style: AppFont.medium14.copyWith(
              color: Theme.of(context).indicatorColor,
            )),
      ),
    );
  }
}
