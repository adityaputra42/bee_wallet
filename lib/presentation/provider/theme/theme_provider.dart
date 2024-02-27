import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/util.dart';
part 'theme_provider.g.dart';

@riverpod
class DarkTheme extends _$DarkTheme {
  @override
  bool build() {
    return PrefHelper.instance.getTheme();
  }

  void changeTheme(bool value) {
    PrefHelper.instance.setDarkTheme(value);
    state = value;
  }
}
