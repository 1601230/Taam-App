import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

//Para crear un StatefulWidget automáticamente, poner stful

class PageConfiguration extends StatefulWidget {
  final void Function(Brightness?)? setBrightness;
  final Brightness? brightness;

  final void Function(String?)? setLanguage;
  final String? language;

  final void Function(List<String>?)? setFoodPreferences;
  final List<String>? foodPreferences;

  const PageConfiguration({Key? key,
    required this.setBrightness, required this.brightness,
    required this.setLanguage, required this.language,
    required this.setFoodPreferences, required this.foodPreferences}) : super(key: key);

  @override
  State<PageConfiguration> createState() => _PageConfigurationState();
}

class _PageConfigurationState extends State<PageConfiguration> {
  List<String> _valuesFoodPreferences = ['Vegetariano', 'Vegano', 'Celiaco'];
  List<String> _selectedFoodPreferences = [];

  List<String> _appLanguage = ['Español', 'Catalán', 'Inglés'];
  String _selectionLanguageMessage = 'Español';

  List<String> _appThemeItems = ['Claro','Oscuro'];
  String _selectionThemeMessage = 'Claro';

  ///Inicializamos los valores de los diferentes campos con los valores pasados
  ///por parametro en el constructor, para que así aparezcan los valores correspondientes
  ///a la configuración indicada por el usuario, es a decir, que si el usuario tiene
  ///la aplicación en Catalán, que en el campo del idioma ponga Catalán
  void initState() {
    super.initState();

    ///Ponemos los correspondientes mensajes de Idioma y preferencias alimentarias
    _selectionLanguageMessage = widget.language!;
    _selectedFoodPreferences = widget.foodPreferences!;

    ///Para el mensaje del tema, debemos verificar que tipo de tema es y poner su
    ///correspondiente string.
    if (widget.brightness == Brightness.light) {
      _selectionThemeMessage = 'Claro';
    } else if (widget.brightness == Brightness.dark){
      _selectionThemeMessage = 'Oscuro';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración'),
        //Icono para volver a la pagina anterior
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () {
            //Solo permitimos volver atrás en el caso de que se pueda, para evitar errores
            while(Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          },
        ),
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
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
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
                    value: _selectionLanguageMessage,
                    onChanged: (String? value) {
                      setState(() {
                        _selectionLanguageMessage = value!;
                        ///Actualizamos el idioma en el main
                        widget.setLanguage!(_selectionLanguageMessage);
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
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: MultiSelectDialogField(
                      title: Text('Selecciona las preferencias alimentarias'),
                      buttonText: Text('Selecciona tus preferencias'),
                      confirmText: const Text('Confirmar'),
                      cancelText: const Text('Cancelar'),
                      initialValue: _selectedFoodPreferences,
                      items: _valuesFoodPreferences.map((option) => MultiSelectItem<String>(option, option)).toList(),
                      onConfirm: (selectedItems) {
                        ///Actualizamos las preferencias en el main
                        widget.setFoodPreferences!(selectedItems);
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
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
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
                      setState(() {
                        _selectionThemeMessage = value!;
                        ///Actualizamos el tema en el main
                        if (_selectionThemeMessage == 'Claro') {
                          widget.setBrightness!(Brightness.light);
                        } else {
                          widget.setBrightness!(Brightness.dark);
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
                onPressed: () {

                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
