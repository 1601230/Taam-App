import 'package:flutter/material.dart';
import 'package:taam_app/pages/foodInformationScreen.dart';
import 'package:taam_app/requests.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      home:MyFoodScreen(productName: "Patata", productImage: "lol"), ///Pagina inicial (para debugar, podeis poner la pagina que esteis desarollando aqui y asi la podreis visualizar a la hora de ejecutar el emulador) (aqui debera ir a pagina principal de la aplicación)
    );
  }
}