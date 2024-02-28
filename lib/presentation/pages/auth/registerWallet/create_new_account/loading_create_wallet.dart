// ignore_for_file: unused_result

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/config.dart';
import '../../../../../utils/util.dart';
import '../../../../provider/provider.dart';

class LoadingCreateWalletScreen extends ConsumerStatefulWidget {
  const LoadingCreateWalletScreen({super.key});

  @override
  ConsumerState<LoadingCreateWalletScreen> createState() =>
      _LoadingCreateWalletScreenState();
}

class _LoadingCreateWalletScreenState
    extends ConsumerState<LoadingCreateWalletScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      ref.watch(appRouteProvider).goNamed('backup_create');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = ref.watch(loadingCreateAccountProvider);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: WidgetHelper.appBar(context: context, title: ''),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 42.h),
          child: SizedBox(
            width: double.infinity,
            child: isLoading ? loadingCreate(context) : succesCreate(context),
          ),
        ),
      ),
    );
  }

  Column loadingCreate(BuildContext context) {
    return Column(
      children: [
        Text(
          "Creating your new wallet",
          style: AppFont.medium14
              .copyWith(color: Theme.of(context).indicatorColor),
        ),
        16.0.height,
        const CircularProgressIndicator(
          color: AppColor.grayColor,
        )
      ],
    );
  }

  Column succesCreate(BuildContext context) {
    return Column(
      children: [
        Text(
          "Success Creating New Wallet",
          style: AppFont.medium14
              .copyWith(color: Theme.of(context).indicatorColor),
        ),
        16.0.height,
        Container(
          width: 48.w,
          height: 48.w,
          padding: EdgeInsets.all(8.h),
          decoration: const BoxDecoration(
              shape: BoxShape.circle, gradient: AppColor.primaryGradient),
          child: Icon(
            Icons.check_rounded,
            size: 34.w,
            color: AppColor.textStrongDark,
          ),
        )
      ],
    );
  }
}
