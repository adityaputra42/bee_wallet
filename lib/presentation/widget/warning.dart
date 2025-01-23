import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import '../../config/config.dart';

class Warning extends StatelessWidget {
  const Warning({super.key, required this.warning, this.color});
  final String warning;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: color ?? AppColor.yellowColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline_rounded,
              size: 28, color: color ?? AppColor.yellowColor),
          width(12),
          Expanded(
            child: Text(
              warning,
              style: AppFont.medium12
                  .copyWith(color: color ?? AppColor.yellowColor),
              overflow: TextOverflow.clip,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
