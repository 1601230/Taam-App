import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences _preferences;

  static const _keyLanguage = 'appLanguage';
  static const _keyBrightness = 'brightness';
  static const _keyFoodPreferences = 'foodPreferences';
  static const _keyLocale = 'appLocale';

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


  static String? getLanguage() {
    if (_preferences.getString(_keyLanguage) != null) {
      return _preferences.getString(_keyLanguage);
    } else {
      switch(window.locale.languageCode) {
        case 'es': return 'Español';
        case 'en': return 'English';
        case 'ca': return 'Català';
      }
    }
  }

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
        return const Locale('es');
        //return Locale(window.locale.languageCode);
    }
  }
}