import 'package:flutter/material.dart';
import 'local_storage.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale = LocalStorage.getLocale() ?? Locale('es'); // Valor por defecto

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners(); // Notifica a los widgets que están escuchando los cambios en este objeto
  }
}