import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../services/local_storage.dart';
import '../services/locale_provider.dart';
import '../services/settings_provder.dart';

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

          _selectedFoodPreferences = settingsProvider.foodPreferences;
          _selectionLanguageMessage = settingsProvider.appLanguage!;

          _valuesFoodPreferences.clear();
          _valuesFoodPreferences.add(AppLocalizations.of(context)!.textVegetarianoDialog);
          _valuesFoodPreferences.add(AppLocalizations.of(context)!.textVeganoDialog);
          _valuesFoodPreferences.add(AppLocalizations.of(context)!.textCeliacoDialog);

          _appThemeItems.clear();

          if (settingsProvider.brightness == Brightness.light) {
            _selectionThemeMessage = AppLocalizations.of(context)!.textClaro;
          } else {
            _selectionThemeMessage = AppLocalizations.of(context)!.textOscuro;
          }

          _appThemeItems.add(AppLocalizations.of(context)!.textClaro);
          _appThemeItems.add(AppLocalizations.of(context)!.textOscuro);

          return Scaffold(
            appBar: AppBar(
                title: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(""),
                        Text(AppLocalizations.of(context)!.titleConfig),
                        Text("        ")
                      ],
                    )
                )
            ),
            body: Container(
              margin: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  ///Columna de cambio de idioma
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

                          ///value: _selectionLanguageMessage,
                          value: settingsProvider.appLanguage,
                          onChanged: (String? value) {
                            setState(() async {
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
                              ///Llamar a la función changeLanguage
                            });
                          },
                        ),
                      )
                    ],
                  ),

                  ///Columna preferencias alimentarias
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                            AppLocalizations.of(context)!.titlePreferenciasConfig,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: MultiSelectDialogField(
                            title: Text(
                                AppLocalizations.of(context)!.textSeleccionaPrefsDialog),
                            buttonText: Text(AppLocalizations.of(context)!.textSeleccionaPrefsConfig),
                            confirmText: const Text('Confirmar'),
                            cancelText: const Text('Cancelar'),
                            initialValue: _selectedFoodPreferences,
                            items: _valuesFoodPreferences.map((option) =>
                                MultiSelectItem<String>(option, option))
                                .toList(),
                            onConfirm: (selectedItems) async {
                              ///Actualizamos las preferencias en el main
                              settingsProvider.setFoodPreferences!(selectedItems);
                              await LocalStorage.setFoodPreferences(
                                  selectedItems);
                            },
                          )
                      )
                    ],
                  ),

                  ///Columna tema de la aplicación
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
                          onChanged: (String? value) {
                            setState(() async {
                              _selectionThemeMessage = value!;

                              ///Actualizamos el tema en el main
                              if (_selectionThemeMessage == AppLocalizations.of(context)!.textClaro) {
                                settingsProvider.setBrightness!(Brightness.light);
                                await LocalStorage.setBrightness(Brightness.light);
                              } else {
                                settingsProvider.setBrightness!(Brightness.dark);
                                await LocalStorage.setBrightness(Brightness.dark);
                              }
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}
