import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/config.dart';
import '../../../../utils/util.dart';
import '../../../provider/provider.dart';
import '../../../widget/widget.dart';

class OnBoardingScreen extends ConsumerWidget {
  OnBoardingScreen({super.key});
  final PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int indexOnboarding = ref.watch(indexOnboardingProvider);

    Widget indicator(int index) {
      return Container(
        width: indexOnboarding == index ? 48.w : 16.w,
        height: 16.w,
        margin: EdgeInsets.symmetric(horizontal: 6.w),
        decoration: BoxDecoration(
            color: indexOnboarding == index
                ? AppColor.primaryColor
                : AppColor.grayColor,
            borderRadius: BorderRadius.circular(8.w)),
      );
    }

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 32.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    ref.watch(contentOnboardingProvider).length, (indexValue) {
                  int index = indexValue - 1;
                  index++;
                  return indicator(index);
                })),
            8.0.width,
            PrimaryButton(
                width: ScreenUtil().screenWidth * 0.425,
                title: indexOnboarding <
                        (ref.watch(contentOnboardingProvider).length - 1)
                    ? "Next"
                    : "Get Started",
                onPressed: () {
                  if (indexOnboarding <
                      (ref.watch(contentOnboardingProvider).length - 1)) {
                    ref
                        .read(indexOnboardingProvider.notifier)
                        .changePage(indexOnboarding + 1);
                    controller.jumpToPage(ref.watch(indexOnboardingProvider));
                  } else {
                    PrefHelper.instance.setFirstInstall();
                    context.goNamed('get_started');
                  }
                }),
          ],
        ),
      ),
      body: SafeArea(
        child: PageView(
          allowImplicitScrolling: true,
          scrollDirection: Axis.horizontal,
          controller: controller,
          onPageChanged: (index) {
            ref.read(indexOnboardingProvider.notifier).changePage(index);
            controller.jumpToPage(ref.watch(indexOnboardingProvider));
          },
          children: ref
              .watch(contentOnboardingProvider)
              .map((e) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        200.0.height,
                        Image.asset(
                          e['image'],
                          width: 334.w,
                        ),
                        64.0.height,
                        Text(
                          e['text'],
                          style: AppFont.medium16.copyWith(
                              color: Theme.of(context).indicatorColor),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
