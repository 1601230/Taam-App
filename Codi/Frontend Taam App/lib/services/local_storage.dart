import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences _preferences;

  static const _keyLanguage = 'appLanguage';
  static const _keyBrightness = 'brightness';
  static const _keyFoodPreferences = 'foodPreferences';
  static const _keyLocale = 'appLocale';
  static const _keyChecked = 'checkedState';

  static Future init() async =>
    _preferences = await SharedPreferences.getInstance();

  static Future setLanguage(String language) async =>
    await _preferences.setString(_keyLanguage, language);

  static Future setBrightness(Brightness brightness) async =>
      await _preferences.setString(_keyBrightness, brightness.toString());

  static Future setFoodPreferences(List<String> foodPreferences) async =>
      await _preferences.setStringList(_keyFoodPreferences, foodPreferences);

  static Future setLocale(Locale locale) async =>
    await _preferences.setString(_keyLocale, locale.toString());

  static Future saveCheckedState(List<bool> isChecked) async {
    List<String> checkedStateAsString = isChecked.map((item) => item.toString()).toList();
    await _preferences.setStringList(_keyChecked, checkedStateAsString);
  }

  static String? getLanguage() =>
      _preferences.getString(_keyLanguage);

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

  static Locale? getLocale() {
    final localeString = _preferences.getString(_keyLocale);
    switch (localeString) {
      case 'en':
        return const Locale('en');
      case 'ca':
        return const Locale('ca');
      case 'es':
        return const Locale('es');
      default:
        return const Locale('en');
    }
  }

  static Future<List<bool>> loadCheckedState(int length) async {
    List<String>? checkedStateAsString = _preferences.getStringList(_keyChecked);
    if (checkedStateAsString == null) {
      List<bool> checked = [];
      for(int i = 0; i < length; i++) {
        checked.add(false);
      }
      return checked;
    } else {
      return checkedStateAsString.map((item) => item == 'true').toList();
    }
  }
}