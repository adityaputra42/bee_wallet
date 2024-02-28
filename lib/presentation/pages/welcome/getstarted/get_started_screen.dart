import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../provider/getStarted/getstarted_provider.dart';
import '../../../widget/widget.dart';

class GetStartedScreen extends ConsumerWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
             
              PrimaryButton(
                  margin: EdgeInsets.symmetric(vertical: 16.h),
                  title: "Start",
                  disable: ref.watch(disableGetStartedProvider),
                  onPressed: () {
                    
                  }),
              
            ],
          ),
        ),
      ),
    );
  }
}
