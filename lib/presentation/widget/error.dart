import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';

import '../../config/config.dart';

import '../../data/src/src.dart';
import 'primary_button.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key, this.ontap, this.error});
  final Function()? ontap;
  final String? error;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppImage.logo,
              width: 284,
            ),
            height(16),
            Text(
              "Oops...",
              style: AppFont.semibold24
                  .copyWith(color: Theme.of(context).indicatorColor),
              textAlign: TextAlign.center,
            ),
            height(16),
            Text(
              error != null ? "Error : $error" : "something went wrong",
              style: AppFont.reguler14
                  .copyWith(color: Theme.of(context).hintColor),
              textAlign: TextAlign.center,
            ),
            height(24),
            PrimaryButton(
              title: "Retry",
              height: 42,
              onPressed: ontap ?? () {},
              margin: const EdgeInsets.symmetric(horizontal: 64),
            )
          ],
        ),
      ),
    );
  }
}
