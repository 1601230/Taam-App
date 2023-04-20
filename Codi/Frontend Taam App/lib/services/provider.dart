import 'package:flutter/foundation.dart';
import 'package:taam_app/services/local_storage.dart';


class SettingsProvider with ChangeNotifier {
  Brightness _brightness = LocalStorage.getBrightness();
  List<String> _foodPreferences = LocalStorage.getFoodPreferences() ?? [];
  String _appLanguage = LocalStorage.getLanguage() ?? 'Español';

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