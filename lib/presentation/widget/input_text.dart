import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/theme/theme.dart';

class InputText extends StatelessWidget {
  final String? title;
  final String? initialValue;
  final String hintText;
  final bool obscureText;
  final Widget? icon;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? prefix;
  final Color? color;
  final Color? filledColor;
  final Function()? ontaped;
  final Function(String)? onChange;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int maxLine;
  final Widget? crossTitle;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final int? maxLength;
  final TextStyle? titleStyle;
  final bool enable;
  final bool cursor;
  final bool autoFocus;
  final bool filled;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  final BorderRadius? borderRadius;
  final BorderSide? borderSide;
  final Color? borderColor;
  final Function()? onComplete;
  final TextAlign? textAlign;
  const InputText(
      {super.key,
      this.obscureText = false,
      this.title,
      this.initialValue,
      required this.hintText,
      this.enable = true,
      this.cursor = true,
      this.autoFocus = false,
      this.filled = false,
      this.onChange,
      this.ontaped,
      this.borderSide,
      this.textInputAction,
      this.icon,
      this.maxLine = 1,
      this.crossTitle,
      this.validator,
      this.controller,
      this.keyboardType,
      this.color,
      this.filledColor,
      this.inputFormatters,
      this.focusNode,
      this.prefixIcon,
      this.prefix,
      this.suffix,
      this.maxLength,
      this.textStyle,
      this.hintStyle,
      this.contentPadding,
      this.borderRadius,
      this.borderColor,
      this.textAlign,
      this.onComplete,
      this.titleStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title == null
            ? const SizedBox()
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title ?? '',
                        style: titleStyle ??
                            AppFont.medium14.copyWith(
                              color: Theme.of(context).indicatorColor,
                            ),
                      ),
                      crossTitle ?? const SizedBox()
                    ],
                  ),
                  height(8),
                ],
              ),
        TextFormField(
            focusNode: focusNode,
            initialValue: initialValue,
            onChanged: onChange,
            validator: validator,
            autofocus: autoFocus,
            showCursor: cursor,
            textAlign: textAlign ?? TextAlign.start,
            textInputAction: textInputAction,
            inputFormatters: inputFormatters,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: keyboardType,
            obscureText: obscureText,
            controller: controller,
            onTap: ontaped,
            maxLines: maxLine,
            maxLength: maxLength,
            onEditingComplete: onComplete,
            style: textStyle ??
                AppFont.medium14
                    .copyWith(color: Theme.of(context).indicatorColor),
            decoration: InputDecoration(
              enabled: enable,
              contentPadding: contentPadding ??
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              suffixIcon: icon,
              suffix: suffix,
              prefixIcon: prefixIcon,
              prefix: prefix,
              hintText: hintText,
              filled: filled,
              fillColor: filledColor,
              hintStyle: hintStyle ??
                  AppFont.reguler12
                      .copyWith(color: Theme.of(context).highlightColor),
              border: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(8),
                borderSide: borderSide ??
                    BorderSide(
                        color: borderColor ?? Theme.of(context).canvasColor,
                        width: 0.5),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(8),
                borderSide: borderSide ??
                    BorderSide(
                        color: borderColor ?? Theme.of(context).canvasColor,
                        width: 0.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(8),
                borderSide: borderSide ??
                    BorderSide(
                        color: borderColor ?? Theme.of(context).canvasColor,
                        width: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(8),
                borderSide: borderSide ??
                    const BorderSide(color: AppColor.primaryColor),
              ),
            )),
      ],
    );
  }
}
