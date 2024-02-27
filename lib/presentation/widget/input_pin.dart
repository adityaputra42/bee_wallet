import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../config/config.dart';

class InputPin extends StatelessWidget {
  const InputPin(
      {super.key,
      this.controller,
      this.onCompleted,
      this.pading = EdgeInsets.zero,
      this.obsecure = false,
      this.keyboardType = TextInputType.name,
      this.lenght = 6});
  final TextEditingController? controller;
  final Function(String)? onCompleted;
  final EdgeInsets pading;
  final int lenght;
  final bool obsecure;
  final TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pading,
      child: PinCodeTextField(
        keyboardType: keyboardType,
        autoDisposeControllers: false,
        autoFocus: false,
        appContext: context,
        length: lenght,
        obscureText: obsecure,
        animationType: AnimationType.fade,
        cursorColor: Theme.of(context).indicatorColor,
        textStyle: AppFont.medium14.copyWith(
          color: Theme.of(context).indicatorColor,
        ),
        animationDuration: const Duration(milliseconds: 500),
        pinTheme: PinTheme(
          inactiveColor: AppColor.grayColor,
          activeColor: AppColor.primaryColor,
          selectedColor: AppColor.primaryColor,
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(8.r),
          fieldHeight: 40.w,
          fieldWidth: 40.w,
          borderWidth: 0.5.h,
          activeFillColor: Colors.white,
        ),
        controller: controller,
        onCompleted: onCompleted,
        onChanged: (value) {},
      ),
    );
  }
}
