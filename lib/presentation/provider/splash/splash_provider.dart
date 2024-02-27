import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../utils/util.dart';
part 'splash_provider.g.dart';

@riverpod
class NewUser extends _$NewUser {
  @override
  bool build() {
    return PrefHelper.instance.isFirstInstall;
  }
}

@Riverpod(keepAlive: true)
class CheckAccountUser extends _$CheckAccountUser {
  @override
  bool build() {
    // bool isLogin = PrefHelper.instance.isLogin;
    return false;
  }
}
