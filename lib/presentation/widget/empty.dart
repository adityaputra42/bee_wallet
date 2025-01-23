import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';

import '../../config/config.dart';
import '../../data/src/app_image.dart';

class Empty extends StatelessWidget {
  const Empty({super.key, required this.title, this.width = 140});
  final String title;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AppImage.empty,
            width: width,
          ),
          height(8),
          Text(
            title,
            style: AppFont.medium16
                .copyWith(color: Theme.of(context).indicatorColor),
          )
        ],
      ),
    );
  }
}
