import 'package:flutter/material.dart';
import 'package:taam_app/requests.dart';

import 'pages/search_product_page.dart';

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
        primarySwatch: Colors.deepPurple,
        brightness: _brightness,
      ),
      home: const MyHomePage(), ///Pagina inicial (para debugar, podeis poner la pagina que esteis desarollando aqui y asi la podreis visualizar a la hora de ejecutar el emulador) (aqui debera ir a pagina principal de la aplicación)
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Spacer(),
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  //Aqui se agrega la navegación a la pantalla de Configuración
                },
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 120.0),
              child: Image.asset(
                'assets/Logo_TaamApp.png',
                width: 200,
                height: 200,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8, bottom: 100.0),
              child: Text("El seu selector de menjar de confiança"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> const MySearchProduct())
                );
              },
              child: const Text('INICIAR'),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}