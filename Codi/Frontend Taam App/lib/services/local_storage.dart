import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences _preferences;

  static const _keyLanguage = 'appLanguage';
  static const _keyBrightness = 'brightness';
  static const _keyFoodPreferences = 'foodPreferences';

  static Future init() async =>
    _preferences = await SharedPreferences.getInstance();

  static Future setLanguage(String language) async =>
    await _preferences.setString(_keyLanguage, language);

  static Future setBrightness(Brightness brightness) async =>
      await _preferences.setString(_keyBrightness, brightness.toString());

  static Future setFoodPreferences(List<String> foodPreferences) async =>
      await _preferences.setStringList(_keyFoodPreferences, foodPreferences);


  static String? getLanguage() => _preferences.getString(_keyLanguage);

  static Brightness getBrightness() {
    if (_preferences.getString(_keyBrightness) == Brightness.light.toString()) {
      return Brightness.light;
    } else if (_preferences.getString(_keyBrightness) == Brightness.dark.toString()) {
      return Brightness.dark;
    } else {
      return Brightness.light;
    }
  }

  static List<String>? getFoodPreferences() =>
    _preferences.getStringList(_keyFoodPreferences);
}