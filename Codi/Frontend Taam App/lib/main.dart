import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taam_app/l10n/l10n.dart';
import 'package:taam_app/pages/page_about_us.dart';
import 'package:taam_app/services/local_storage.dart';
import 'package:taam_app/services/locale_provider.dart';
import 'package:taam_app/services/settings_provder.dart';
import 'package:taam_app/pages/page_configuration.dart';
import 'package:taam_app/pages/general_question_page.dart';
import 'pages/search_product_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/src/material_localizations.dart';
import 'package:flutter_localizations/src/cupertino_localizations.dart';
import 'package:flutter_localizations/src/widgets_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

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
          debugShowCheckedModeBanner: false,
          title: 'Main',
          theme: ThemeData(
            primarySwatch: Colors.teal,
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
          home:  MyHomePage(),
        );
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
     final settingsProvider = Provider.of<SettingsProvider>(context);
     final Uri _urlSpanish = Uri.parse('https://docs.google.com/forms/d/e/1FAIpQLSf5VNsQ0XZzVUexzUPYntTl7W1628_xRUNF1t7VmeMo0Qck8A/viewform');
     final Uri _urlCatalan = Uri.parse('https://docs.google.com/forms/d/e/1FAIpQLSc7vey1H6DQHgWKVadpHDFbUaKE6CP6HQq5VdCUsqm9I_0yQA/viewform');
     final Uri _urlEnglish = Uri.parse('https://docs.google.com/forms/d/e/1FAIpQLSe2E3Td31bY3518-o4ue7M8ZDVsnkz51GHGH6eAPO7z3TZTwQ/viewform');
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Divider(),
              Column(
                children: [
                Padding(
                  padding: EdgeInsets.only(top: 120.0),
                  child: Image.asset(
                    'assets/Logo_TaamApp.png',
                    width: 200,
                    height: 200,
                  ),
                ),
              Padding(
                padding: EdgeInsets.only(top: 8, bottom: 40.0),
                child: Text(
                  AppLocalizations.of(context)!.textBienvenida,
                  style: GoogleFonts.lato(
                    letterSpacing: 1,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (settingsProvider.foodPreferences.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MySearchProduct()),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PageConfiguration()),
                    );
                  }
                },
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(120, 50)),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.amber.shade700),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: Text(
                  AppLocalizations.of(context)!.textBotonIniciar,
                  style: GoogleFonts.lato(
                    letterSpacing: 1,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
              const Padding(padding: EdgeInsets.only(top: 50)),
              Container(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PageAboutUs()),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.info_outline,
                            color: Colors.cyan,
                          ),
                          Text(
                            AppLocalizations.of(context)!.textAboutUsRedirection,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.cyan,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GeneralQuestionsPage()),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.question_answer,
                            color: Colors.cyan,
                          ),
                          Text(
                            AppLocalizations.of(context)!.textFACRedirection,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.cyan,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        switch(settingsProvider.appLanguage) {
                          case 'Español': _launchUrl(_urlSpanish); break;
                          case 'Català': _launchUrl(_urlCatalan); break;
                          case 'English': _launchUrl(_urlEnglish); break;
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.poll,
                            color: Colors.cyan,
                          ),
                          Text(
                            AppLocalizations.of(context)!.textEncuesta,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.cyan,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}

Future<void> _launchUrl(final _url) async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}