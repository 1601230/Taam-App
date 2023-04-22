import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';

import '../services/local_storage.dart';
import '../services/locale_provider.dart';
import '../services/settings_provder.dart';

//Para crear un StatefulWidget automáticamente, poner stful

class PageConfiguration extends StatefulWidget {
  const PageConfiguration({super.key});

  @override
  State<PageConfiguration> createState() => _PageConfigurationState();
}

class _PageConfigurationState extends State<PageConfiguration> {
  List<String> _valuesFoodPreferences = ['Vegetariano', 'Vegano', 'Celiaco'];
  List<String> _selectedFoodPreferences = [];

  List<String> _appLanguage = ['Español', 'Català', 'English'];
  String _selectionLanguageMessage = '';

  List<String> _appThemeItems = ['Claro', 'Oscuro'];
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

          if (settingsProvider.brightness == Brightness.light) {
            _selectionThemeMessage = 'Claro';
          } else {
            _selectionThemeMessage = 'Oscuro';
          }

          return Scaffold(
            appBar: AppBar(
                title: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(""),
                        Text('Configuración'),
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
                        child: const Text(
                            'Idioma',
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
                        child: const Text(
                            'Preferencias alimentarias',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: MultiSelectDialogField(
                            title: Text(
                                'Selecciona las preferencias alimentarias'),
                            buttonText: Text('Selecciona tus preferencias'),
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
                        child: const Text(
                            'Tema de la aplicación',
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
                              if (_selectionThemeMessage == 'Claro') {
                                settingsProvider.setBrightness!(Brightness.light);
                                await LocalStorage.setBrightness(
                                    Brightness.light);
                              } else {
                                settingsProvider.setBrightness!(Brightness.dark);
                                await LocalStorage.setBrightness(
                                    Brightness.dark);
                              }
                            });
                          },
                        ),
                      )
                    ],
                  ),

                  ///Container para el botón de confirmación
                  Container(
                    margin: EdgeInsets.all(20),
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      child: const Text('Confirmar'),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          );
        }
    );
  }
}
