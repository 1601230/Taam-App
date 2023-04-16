import 'package:flutter/foundation.dart';

class SettingsProvider with ChangeNotifier {
  Brightness _brightness = Brightness.light;
  List<String> _foodPreferences = [];
  String _appLanguage = 'Español';

  Brightness get brightness => _brightness;
  List<String> get foodPreferences => _foodPreferences;
  String get appLanguage => _appLanguage;

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