
import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            width: width.w,
          ),
          8.0.height,
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
