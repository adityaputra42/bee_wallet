import 'package:bee_wallet/utils/util.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../config/theme/theme.dart';

class DropDownCustom extends StatelessWidget {
  const DropDownCustom(
      {super.key,
      required this.listData,
      this.title,
      required this.hint,
      this.value,
      this.onChange,
      this.color,
      this.hintStyle,
      this.textStyle,
      this.contentPadding,
      this.borderColor,
      this.borderRadius,
      this.filledColor,
      this.filled = false,
      this.heightWidget,
      this.prefixIcon});
  final EdgeInsetsGeometry? contentPadding;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final Color? filledColor;
  final bool filled;
  final String hint;
  final String? title;
  final String? value;
  final double? heightWidget;

  final List<String> listData;
  final Function(String?)? onChange;
  final Color? color;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        title == null
            ? const SizedBox()
            : Column(
                children: [
                  Text(
                    title ?? '',
                    style: AppFont.medium14.copyWith(
                      color: Theme.of(context).indicatorColor,
                    ),
                  ),
                  height(8),
                ],
              ),
        SizedBox(
          height: heightWidget,
          child: DropdownButtonFormField2<String>(
            isExpanded: true,
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              contentPadding: EdgeInsets.zero,
              filled: filled,
              fillColor: filledColor,
              hintStyle: hintStyle ??
                  AppFont.reguler12
                      .copyWith(color: Theme.of(context).hintColor),
              border: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: borderColor ?? Theme.of(context).canvasColor,
                    width: 0.5),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: borderColor ?? Theme.of(context).canvasColor,
                    width: 0.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: borderColor ?? Theme.of(context).canvasColor,
                    width: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColor.primaryColor),
              ),
            ),
            hint: Text(
              hint,
              style: AppFont.reguler14.copyWith(
                  fontWeight: FontWeight.w300, color: AppColor.grayColor),
            ),
            items: listData
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item,
                          style: AppFont.reguler12.copyWith(
                              color: Theme.of(context).indicatorColor)),
                    ))
                .toList(),
            validator: (value) {
              if (value == null) {
                return 'Pilih satuan.';
              }
              return null;
            },
            value: value,
            onChanged: onChange,
            buttonStyleData: const ButtonStyleData(
              height: 40,
              padding: EdgeInsets.only(
                right: 8,
              ),
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.expand_more,
              ),
              iconSize: 20,
            ),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                color: color ?? Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 32,
              padding: EdgeInsets.only(left: 16, right: 12),
            ),
          ),
        ),
      ],
    );
  }
}
