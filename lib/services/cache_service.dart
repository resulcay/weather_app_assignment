// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  CacheManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }
  static final CacheManager _instance = CacheManager._init();

  SharedPreferences? _preferences;

  static CacheManager get instance => _instance;

  static Future prefrencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
  }

  void setString(PreferencesKeys key, String value) async {
    await _preferences?.setString(key.toString(), value);
  }

  Future<void> setStringValue(PreferencesKeys key, String value) async {
    await _preferences!.setString(key.toString(), value);
  }

  String getStringValue(PreferencesKeys key) =>
      _preferences?.getString(key.toString()) ?? '';
}

enum PreferencesKeys {
  TOKEN,
}
