import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/config.dart';

class WidgetHelper {
  static appBar(
      {required BuildContext context,
      Function()? onTap,
      Function()? onTapTitle,
      required String title,
      Widget? icon,
      Widget? iconTitle,
      Color? color,
      double? fontSize,
      bool isCanBack = true}) {
    return AppBar(
      elevation: 0,
      title: Row(
        children: [
          isCanBack
              ? InkWell(
                  onTap: onTap ??
                      () {
                        context.pop();
                      },
                  child: Container(
                    width: 36,
                    height: 36,
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            width: 1, color: Theme.of(context).hintColor)),
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Theme.of(context).indicatorColor,
                      size: 20,
                    ),
                  ))
              : const SizedBox(
                  width: 40,
                ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: GestureDetector(
              onTap: onTapTitle ?? () {},
              child: iconTitle != null
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: AppFont.medium16.copyWith(
                              color: Theme.of(context).indicatorColor,
                              fontSize: fontSize ?? 16),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                        iconTitle
                      ],
                    )
                  : Text(
                      title,
                      style: AppFont.medium16.copyWith(
                          color: Theme.of(context).indicatorColor,
                          fontSize: fontSize ?? 16),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          icon ??
              const SizedBox(
                width: 32,
              ),
        ],
      ),
      automaticallyImplyLeading: false,
      backgroundColor: color ?? Theme.of(context).colorScheme.surface,
      toolbarHeight: 60,
    );
  }
}
