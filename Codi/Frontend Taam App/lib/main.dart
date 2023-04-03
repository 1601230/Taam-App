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
      home: PageConfiguration(setBrightness: setBrightness, brightness: _brightness), //home: const MyHomePage(title: 'Flutter Demo Home Page'),     home: PageConfiguration()
    );
  }
}
