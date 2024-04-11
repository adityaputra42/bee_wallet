import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/config.dart';
import '../../../../data/src/src.dart';
import '../../../../utils/util.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () async {
      final account = await DbHelper.instance.getSelectedWallet();

      if (account?.id != null) {
        ref.watch(appRouteProvider).goNamed('main');
      } else {
        ref.watch(appRouteProvider).goNamed('get_started');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          // Image.asset(
          //   AppImage.mask,
          //   width: double.infinity,
          //   fit: BoxFit.cover,
          // ),
          SafeArea(
            child: Center(
              child: ZoomIn(
                delay: const Duration(milliseconds: 500),
                duration: const Duration(seconds: 2),
                child: Image.asset(
                  AppImage.logo,
                  height: 148.w,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
