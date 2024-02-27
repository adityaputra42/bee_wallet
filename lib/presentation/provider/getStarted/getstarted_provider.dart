import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/model/model.dart';
import '../../../utils/util.dart';

part 'getstarted_provider.g.dart';

@riverpod
class DisableGetStarted extends _$DisableGetStarted {
  @override
  bool build() => true;

  validateButton(bool term) {
    if (term == true) {
      state = false;
    } else {
      state = true;
    }
  }
}

@riverpod
class UserTerm extends _$UserTerm {
  @override
  bool build() => false;

  changeValue(bool value) {
    state = value;
    ref.read(disableGetStartedProvider.notifier).validateButton(value);
  }
}

@riverpod
class PasswordCreate extends _$PasswordCreate {
  @override
  String build() => '';

  changeValue(String value) {
    state = value;
  }
}

@riverpod
Future<void> password(PasswordRef ref) async {
  await DbHelper.instance
      .setPassword(Password(password: ref.watch(passwordCreateProvider)));
}
