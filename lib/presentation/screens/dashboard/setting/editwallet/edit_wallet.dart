import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';

class EditWalletScreen extends StatelessWidget {
  const EditWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: WidgetHelper.appBar(context: context, title: "Edit Wallet"),
    );
  }
}
