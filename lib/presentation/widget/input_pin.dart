import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../config/theme/theme.dart';

class InputPin extends StatelessWidget {
  const InputPin(
      {super.key,
      this.controller,
      this.onCompleted,
      this.onChange,
      this.pading = EdgeInsets.zero,
      this.obsecure = false,
      this.autoFocus = true,
      this.fillColor,
      this.keyboardType = TextInputType.name,
      this.lenght = 6});
  final TextEditingController? controller;
  final Function(String)? onCompleted;
  final Function(String)? onChange;
  final EdgeInsets pading;
  final int lenght;
  final bool obsecure;
  final bool autoFocus;
  final Color? fillColor;

  final TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pading,
      child: PinCodeTextField(
        errorTextSpace: 0,
        keyboardType: keyboardType,
        autoDisposeControllers: false,
        autoFocus: autoFocus,
        appContext: context,
        length: lenght,
        enableActiveFill: true,
        obscureText: obsecure,
        animationType: AnimationType.fade,
        cursorColor: Theme.of(context).indicatorColor,
        textStyle: AppFont.bold24.copyWith(
          color: Theme.of(context).indicatorColor,
        ),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        animationDuration: const Duration(milliseconds: 500),
        pinTheme: PinTheme(
          inactiveColor: Theme.of(context).canvasColor,
          activeColor: AppColor.primaryColor,
          selectedColor: AppColor.primaryColor,
          selectedFillColor: fillColor ?? Theme.of(context).cardColor,
          activeFillColor: fillColor ?? Theme.of(context).cardColor,
          inactiveFillColor: fillColor ?? Theme.of(context).cardColor,
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(8),
          fieldHeight: 40,
          fieldWidth: 40,
          borderWidth: 0.25,
        ),
        obscuringWidget: Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Theme.of(context).indicatorColor),
        ),
        controller: controller,
        onCompleted: onCompleted,
        onChanged: onChange,
      ),
    );
  }
}
