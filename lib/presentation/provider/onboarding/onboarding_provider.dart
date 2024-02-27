import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/src/app_image.dart';

part 'onboarding_provider.g.dart';

@riverpod
class ContentOnboarding extends _$ContentOnboarding {
  @override
  List<Map<String, dynamic>> build() => [
        {
          "image": AppImage.ilustrasi1,
          "text": "Protecting Your Digital Fortune, One Wallet at a Time."
        },
        {
          "image": AppImage.ilustrasi1,
          "text": "Where Your Assets Thrive, Protected with Precision."
        },
        {
          "image": AppImage.ilustrasi1,
          "text": "Crypto Wallet Trusted\nYour Gateway to Financial Confidence"
        },
      ];
}

@riverpod
class IndexOnboarding extends _$IndexOnboarding {
  @override
  int build() => 0;

  changePage(int index) {
    state = index;
  }
}
