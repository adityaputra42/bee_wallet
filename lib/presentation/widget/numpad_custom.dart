import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/config.dart';

class Numpadcustom extends StatelessWidget {
  final TextEditingController controller;
  final Function delete;

  const Numpadcustom({
    super.key,
    required this.controller,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 12.w,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              NumbButton(
                number: 1,
                controller: controller,
              ),
              8.0.width,
              NumbButton(
                number: 2,
                controller: controller,
              ),
              8.0.width,
              NumbButton(
                number: 3,
                controller: controller,
              ),
            ],
          ),
          8.0.height,
          Row(
            children: [
              NumbButton(
                number: 4,
                controller: controller,
              ),
              8.0.width,
              NumbButton(
                number: 5,
                controller: controller,
              ),
              8.0.width,
              NumbButton(
                number: 6,
                controller: controller,
              ),
            ],
          ),
          8.0.height,
          Row(
            children: [
              NumbButton(
                number: 7,
                controller: controller,
              ),
              8.0.width,
              NumbButton(
                number: 8,
                controller: controller,
              ),
              8.0.width,
              NumbButton(
                number: 9,
                controller: controller,
              ),
            ],
          ),
          8.0.height,
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 45.h,
                ),
              ),
              8.0.width,
              NumbButton(
                number: 0,
                controller: controller,
              ),
              8.0.width,
              Expanded(
                child: SizedBox(
                    width: 90.w,
                    height: 45.h,
                    child: TextButton(
                      onPressed: () => delete(),
                      child: Center(
                          child: Icon(
                        Icons.backspace_outlined,
                        color: Theme.of(context).indicatorColor,
                        size: 24.w,
                      )),
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class NumbButton extends StatelessWidget {
  final int number;
  final TextEditingController controller;
  const NumbButton({
    Key? key,
    required this.number,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 45.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Theme.of(context).cardColor),
        child: TextButton(
            onPressed: () {
              controller.text += number.toString();
            },
            child: Center(
              child: Text(
                number.toString(),
                style: AppFont.reguler16
                    .copyWith(color: Theme.of(context).indicatorColor),
              ),
            )),
      ),
    );
  }
}
