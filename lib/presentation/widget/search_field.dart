import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/config.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    this.onChange,
    this.validator,
    this.controller,
    this.focusNode,
    this.inputFormatters,
    this.onEditingComplete,
    this.keyboardType,
    this.color,
    this.textInputAction,
  });

  final Function(String)? onChange;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Function()? onEditingComplete;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54.h,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: AppFont.medium14.copyWith(
          color: Theme.of(context).indicatorColor,
        ),
        controller: controller,
        onChanged: onChange,
        validator: validator,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        onEditingComplete: onEditingComplete,
        inputFormatters: inputFormatters,
        focusNode: focusNode,
        decoration: InputDecoration(
            fillColor: color ?? Theme.of(context).cardColor,
            filled: true,
            prefixIcon: Icon(
              Icons.search,
              size: 20.w,
            ),
            hintText: "Search",
            hintStyle: AppFont.reguler14.copyWith(
                fontWeight: FontWeight.w300, color: AppColor.grayColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: AppColor.primaryColor),
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w)),
      ),
    );
  }
}
