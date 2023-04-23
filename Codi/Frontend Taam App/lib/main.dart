import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taam_app/l10n/l10n.dart';
import 'package:taam_app/services/local_storage.dart';
import 'package:taam_app/services/locale_provider.dart';
import 'package:taam_app/services/settings_provder.dart';
import 'package:taam_app/pages/foodInformationScreen.dart';
import 'package:taam_app/requests.dart';
import 'package:taam_app/pages/page_configuration.dart';
import 'pages/search_product_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/src/material_localizations.dart';
import 'package:flutter_localizations/src/cupertino_localizations.dart';
import 'package:flutter_localizations/src/widgets_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

@override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SettingsProvider>(create: (_) => SettingsProvider()),
        ChangeNotifierProvider<LocaleProvider>(create: (context) => LocaleProvider())
      ],
      builder: (context,_) {
        final watch = Provider.of<SettingsProvider>(context);
        return MaterialApp(
          title: 'Main',
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            brightness: watch.brightness,
          ),
          supportedLocales: L10n.all,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          locale: Provider.of<LocaleProvider>(context).locale,
          home: const MyHomePage(), ///Pagina inicial (para debugar, podeis poner la pagina que esteis desarollando aqui y asi la podreis visualizar a la hora de ejecutar el emulador) (aqui debera ir a pagina principal de la aplicación)
        );
      }
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<SettingsProvider>(create: (_) => SettingsProvider())
        ],
        builder: (context,_) {
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PageConfiguration()),
                        );
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
                  Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 100.0),
                    child: Text(
                        AppLocalizations.of(context)!.textBienvenida
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=> const MySearchProduct())
                      );
                    },
                    child: Text(AppLocalizations.of(context)!.textBotonIniciar),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          );
        }
    );
  }
}