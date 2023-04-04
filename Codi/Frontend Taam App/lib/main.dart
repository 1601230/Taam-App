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
  late Brightness? _brightness = Brightness.light;
  late List<String>? _foodPreferences = [];
  late String? _appLanguage = 'Español';

  void setBrightness(Brightness? brightness) {
    setState(() {
      _brightness = brightness!;
    });
  }

  void setLanguage(String? language) {
    setState(() {
      _appLanguage = language!;
    });
  }

  void setFoodPreferences(List<String>? foodPreferences) {
    setState(() {
      _foodPreferences = foodPreferences!;
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
      home: PageConfiguration(setBrightness: setBrightness, brightness: _brightness,
        setLanguage: setLanguage, language: _appLanguage,
        setFoodPreferences: setFoodPreferences, foodPreferences: _foodPreferences,), //home: const MyHomePage(title: 'Flutter Demo Home Page'),     home: PageConfiguration()
    );
  }
}