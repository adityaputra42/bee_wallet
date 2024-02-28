import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/config.dart';
import '../../../data/model/model.dart';
import '../../../data/src/src.dart';
import '../../provider/getStarted/getstarted_provider.dart';
import '../../widget/widget.dart';


final confirmPinController =
    StateProvider<TextEditingController>((ref) => TextEditingController());

class SheetConfirmPin extends ConsumerWidget {
  const SheetConfirmPin({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   
    final password = ref.watch(passwordCreateProvider);
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 24.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AppImage.logo,
            width: 115.w,
          ),
          16.0.height,
          Text(
            "Confirm Security Password",
            style: AppFont.semibold16
                .copyWith(color: Theme.of(context).indicatorColor),
            textAlign: TextAlign.center,
          ),
          24.0.height,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 34.w),
            child: InputPin(
              keyboardType: TextInputType.none,
              controller: ref.watch(confirmPinController),
              obsecure: true,
              onCompleted: (v) {
                if (password == v) {
                  DbHelper.instance.setPassword(Password(password: password));
                  Navigator.pop(context);
                  context.goNamed('succes_register');
                } else {
                  ref.watch(confirmPinController).clear();
                  MethodHelper().showSnack(
                      context: context,
                      content: "Password didn't match",
                      backgorund: AppColor.redColor);
                }
              },
            ),
          ),
          16.0.height,
          Numpadcustom(
              controller: ref.watch(confirmPinController),
              delete: () {
                ref.watch(confirmPinController).text = ref.watch(confirmPinController).text != ''
                    ? ref.watch(confirmPinController).text
                        .substring(0, ref.watch(confirmPinController).text.length - 1)
                    : ref.watch(confirmPinController).text;
              })
        ],
      ),
    );
  }
}
