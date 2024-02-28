import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../../../../config/config.dart';
import '../../../../data/src/src.dart';
import '../../../../utils/util.dart';
import '../../../provider/theme/theme_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () async {
      final account = await DbHelper.instance.getSelectedWallet();
      final pasword = await DbHelper.instance.getPassword();
      if (account?.id != null) {
        ref.watch(appRouteProvider).goNamed('main');
      } else if (pasword.password != null) {
        ref.watch(appRouteProvider).goNamed('choose_register');
      } else {
        ref.watch(appRouteProvider).goNamed('get_started');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isdark = ref.watch(darkThemeProvider);
    return ScaffoldGradientBackground(
      gradient: isdark ? AppColor.splashDarkGradient : AppColor.primaryGradient,
      body: Center(
          child: Image.asset(
        isdark ? AppIcon.iconSlashDark : AppImage.logoSplash,
        height: 140.w,
      )),
    );
  }
}
