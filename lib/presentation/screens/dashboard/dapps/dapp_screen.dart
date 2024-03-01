
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/config.dart';
import '../../../provider/provider.dart';
import '../../../widget/widget.dart';
import 'components/new_dapps.dart';
import 'components/sheet_select_network.dart';

class DappScreen extends ConsumerWidget {
  const DappScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          elevation: 0,
          shadowColor: AppColor.grayColor,
          title: Padding(
              padding: EdgeInsets.fromLTRB(0, 12.h, 0, 0),
              child: SearchField(
                controller: ref.watch(searchWebProvider),
                onEditingComplete: () {
                  if (ref.watch(searchWebProvider).text.isNotEmpty) {
                    if (ref.watch(chainDappProvider).chainId != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DappsWeb3(
                                    initialUrl:
                                        ref.watch(searchWebProvider).text,
                                  )));
                    } else {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => SheetSelectNetworkDapp(
                                url: ref.watch(searchWebProvider).text,
                              ),
                          backgroundColor:
                              Theme.of(context).colorScheme.background,
                          showDragHandle: true,
                          isDismissible: false,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16.r))));
                    }
                  }
                },
              )),
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).colorScheme.background,
          toolbarHeight: 76.h,
        ),
        body: ListView(
          children: [],
        ));
  }
}
