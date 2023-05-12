import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../requests.dart';
import 'package:taam_app/pages/page_about_us.dart';
import '../services/local_storage.dart';
import '../services/locale_provider.dart';
import '../services/settings_provder.dart';
import 'general_question_page.dart';

///Funciones conectadas a back-end
///---------------------------------------------------------------------------------------------------------------------------------------------
void _setLanguageServer(String language) {
  switch (language) {
    case "Español": setLanguageServer("spanish"); break;
    case "English": setLanguageServer("english"); break;
    case "Català": setLanguageServer("catalan"); break;
    default: break;
  }
}

Future<String> _getPreferences() async {
  Map<String, dynamic> aux = await getPreferences();
  String stringPreferences = jsonEncode(aux);
  String preferencesContent = stringPreferences.substring(stringPreferences.indexOf('[') + 1, stringPreferences.indexOf(']'));
  return preferencesContent;
}

///---------------------------------------------------------------------------------------------------------------------------------------------


class PageConfiguration extends StatefulWidget {
  const PageConfiguration({super.key});

  @override
  State<PageConfiguration> createState() => _PageConfigurationState();
}

class _PageConfigurationState extends State<PageConfiguration> {
  List<String> _valuesFoodPreferences = [];

  List<String> _selectedFoodPreferences = [];

  List<String> _appLanguage = ['Español', 'Català', 'English'];
  String _selectionLanguageMessage = '';

  List<String> _appThemeItems = [];
  String _selectionThemeMessage = '';

  List<bool> _isChecked = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    String preferences = await _getPreferences();
    setState(()  {
      _valuesFoodPreferences = preferences.split(", ");
    });
    List<bool> checkedAux = await LocalStorage.loadCheckedState(_valuesFoodPreferences.length);
    setState(() {
      _isChecked = checkedAux;
    });
  }

  void _saveCheckedState() async {
    await LocalStorage.saveCheckedState(_isChecked);
  }

  ///Inicializamos los valores de los diferentes campos con los valores pasados
  ///por parametro en el constructor, para que así aparezcan los valores correspondientes
  ///a la configuración indicada por el usuario, es a decir, que si el usuario tiene
  ///la aplicación en Catalán, que en el campo del idioma ponga Catalán

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(
        builder: (context, localeProvider, child) {
          final settingsProvider = Provider.of<SettingsProvider>(context);
          final localeProvider = Provider.of<LocaleProvider>(context);

          ///Inicializamos los valores de los diferentes campos con los valores pasados
          ///por parametro en el constructor, para que así aparezcan los valores correspondientes
          ///a la configuración indicada por el usuario, es a decir, que si el usuario tiene
          ///la aplicación en Catalán, que en el campo del idioma ponga Catalán
          _selectionLanguageMessage = settingsProvider.appLanguage!;
          _selectedFoodPreferences = settingsProvider.foodPreferences;

          _selectedFoodPreferences.clear();
          for (int i=0; i<_isChecked.length; i++) {
            if (_isChecked[i]) {
              _selectedFoodPreferences.add(_valuesFoodPreferences[i]);
            }
          }

          _appThemeItems.clear();

          if (settingsProvider.brightness == Brightness.light) {
            _selectionThemeMessage = AppLocalizations.of(context)!.textClaro;
          } else {
            _selectionThemeMessage = AppLocalizations.of(context)!.textOscuro;
          }

          _appThemeItems.add(AppLocalizations.of(context)!.textClaro);
          _appThemeItems.add(AppLocalizations.of(context)!.textOscuro);

          ///Funciones internas pantalla
          ///---------------------------------------------------------------------------------------------------------------------------------------------
          void _handleSelectionThemeMessage(String? value) async {
            _selectionThemeMessage = value!;

            ///Actualizamos el tema en el main
            if (_selectionThemeMessage == AppLocalizations.of(context)!.textClaro) {
              settingsProvider.setBrightness!(Brightness.light);
              await LocalStorage.setBrightness(Brightness.light);
            } else {
              settingsProvider.setBrightness!(Brightness.dark);
              await LocalStorage.setBrightness(Brightness.dark);
            }

            setState(() {});
          }

          void _handleSelectionLanguageMessage(String? value) async {
            _selectionLanguageMessage = value!;

            settingsProvider.setLanguage(_selectionLanguageMessage);
            switch(_selectionLanguageMessage) {
              case 'Español':
                localeProvider.setLocale(const Locale('es'));
                await LocalStorage.setLocale(const Locale('es'));
                break;
              case 'English':
                localeProvider.setLocale(const Locale('en'));
                await LocalStorage.setLocale(const Locale('en'));
                break;
              case 'Català':
                localeProvider.setLocale(const Locale('ca'));
                await LocalStorage.setLocale(const Locale('ca'));
                break;
            }
            await LocalStorage.setLanguage(_selectionLanguageMessage);

            _setLanguageServer(_selectionLanguageMessage);
            _loadPreferences();
          }
          ///---------------------------------------------------------------------------------------------------------------------------------------------

          return Scaffold(
            appBar: AppBar(
                title: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(""),
                        Text(AppLocalizations.of(context)!.titleConfig),
                        Text("   ")
                      ],
                    )
                ),
              actions: [
                IconButton(
                  icon: Icon(Icons.question_mark),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GeneralQuestionsPage()),
                    );
                  },
                ),
              ],
            ),
            body:
            SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
                margin: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      // Columna de cambio de idioma
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Text(
                                AppLocalizations.of(context)!.titleIdiomaConfig,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: DropdownButton(
                              items: _appLanguage.map((String itemsValues) {
                                return DropdownMenuItem(
                                  value: itemsValues,
                                  child: Text(itemsValues),
                                );
                              }).toList(),
                              value: settingsProvider.appLanguage,
                              onChanged: _handleSelectionLanguageMessage,
                            ),
                          )
                        ],
                      ),
                      // Columna tema de la aplicación
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Text(
                                AppLocalizations.of(context)!.titleTemaAppConfig,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: DropdownButton(
                              items: _appThemeItems.map((String itemsValues) {
                                return DropdownMenuItem(
                                  value: itemsValues,
                                  child: Text(itemsValues),
                                );
                              }).toList(),
                              value: _selectionThemeMessage,
                              onChanged: _handleSelectionThemeMessage,
                            ),
                          ),
                        ],
                      ),
                      // Columna preferencias alimentarias
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Text(
                              AppLocalizations.of(context)!.titlePreferenciasConfig,
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(0),
                            child: Container(
                              width: 300,
                              height: 350,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: _valuesFoodPreferences.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return CheckboxListTile(
                                    title: Text(_valuesFoodPreferences[index]),
                                    value: _isChecked[index],
                                    onChanged: (value) async {
                                      setState(() {
                                        _isChecked[index] = value!;
                                        _saveCheckedState();
                                      });
                                      if (_isChecked[index] == true) {
                                        _selectedFoodPreferences.add(_valuesFoodPreferences[index]);
                                      } else {
                                        if(_selectedFoodPreferences.contains(_valuesFoodPreferences[index]))
                                          _selectedFoodPreferences.remove(_valuesFoodPreferences[index]);
                                      }
                                      settingsProvider.setFoodPreferences(_selectedFoodPreferences);
                                      await LocalStorage.setFoodPreferences(_selectedFoodPreferences);
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
            )
          );
        }
    );
  }
}
