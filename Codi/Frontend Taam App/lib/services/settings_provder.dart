import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:taam_app/services/local_storage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SettingsProvider with ChangeNotifier {
  Brightness _brightness = LocalStorage.getBrightness();
  List<String> _foodPreferences = LocalStorage.getFoodPreferences() ?? [];
  String? _appLanguage = LocalStorage.getLanguage();

  Brightness get brightness => _brightness;
  List<String> get foodPreferences => _foodPreferences;
  String? get appLanguage => _appLanguage;

  void setBrightness(Brightness brightness) {
    _brightness = brightness;
    notifyListeners();
  }

  void setLanguage(String language) {
    _appLanguage = language;
    notifyListeners();
  }

  void setFoodPreferences(List<String> foodPreferences) {
    _foodPreferences = foodPreferences;
    notifyListeners();
  }
}