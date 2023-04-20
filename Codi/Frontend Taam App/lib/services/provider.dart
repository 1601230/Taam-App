import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  /*void savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('brightness', _brightness.toString());
    prefs.setStringList('foodPreferences', _foodPreferences);
    prefs.setString('appLanguage', _appLanguage);
  }

  void loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    _brightness = prefs.getString('brightness') == Brightness.light.toString() ? Brightness.light : Brightness.dark;
    _foodPreferences = prefs.getStringList('foodPreferences') ?? [];
    _appLanguage = prefs.getString('appLanguage') ?? 'Español';
    notifyListeners();
  }*/
}