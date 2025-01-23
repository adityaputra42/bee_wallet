import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  late final SharedPreferences _pref;

  static PrefHelper instance = PrefHelper();

  Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  Future<bool> saveToken(String token) async {
    return await _pref.setString('token', token);
  }

  String get token => _pref.getString('token') ?? '';

  Future<bool> setFirstInstall() async {
    return await _pref.setBool("firstInstall", false);
  }

  bool get isFirstInstall => _pref.getBool("firstInstall") ?? true;

  Future<bool> setLogin(bool login) async {
    return await _pref.setBool("islogin", login);
  }

  bool get isLogin => _pref.getBool("islogin") ?? true;

  Future<bool> setFingerprint(bool login) async {
    return await _pref.setBool("fingerprint", login);
  }

  bool get isFingerprint => _pref.getBool("fingerprint") ?? false;

  Future<bool> setSecurty(String securityTyep) async {
    return await _pref.setString("securityType", securityTyep);
  }

  String? get securityType => _pref.getString("securityType");

  setDarkTheme(bool value) {
    _pref.setBool("THEMESTATUS", value);
  }

  bool getTheme() {
    var phoneTheme =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    bool isDarkMode = phoneTheme == Brightness.dark;
    return _pref.getBool("THEMESTATUS") ?? isDarkMode;
  }
}
