import 'package:flutter/material.dart';
import 'package:taam_app/requests.dart';
import 'package:taam_app/page_configuration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Brightness _brightness = Brightness.light;
  late List<String> _selectedValuesFoodPreferences;
  late String _appLanguage;

  void setBrightness(Brightness? brightness) {
    setState(() {
      _brightness = brightness!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: _brightness,
      ),
      home: ///Pagina inicial (para debugar, podeis poner la pagina que esteis desarollando aqui y asi la podreis visualizar a la hora de ejecutar el emulador) (aqui debera ir a pagina principal de la aplicación)
    );
  }
}
