import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

//Para crear un StatefulWidget automáticamente, poner stful

class PageConfiguration extends StatefulWidget {
  final void Function(Brightness?)? setBrightness;
  final Brightness brightness;
  const PageConfiguration({Key? key, required this.setBrightness, required this.brightness}) : super(key: key);

  @override
  State<PageConfiguration> createState() => _PageConfigurationState();
}

class _PageConfigurationState extends State<PageConfiguration> {
  List<String> _selectedValuesFoodPreferences = ['Vegetariano', 'Vegano', 'Celiaco'];

  List<String> _appLanguage = ['Español', 'Catalán', 'Inglés'];
  String _selectionLanguageMessage = 'Español';

  List<String> _appThemeItems = ['Claro','Oscuro'];
  String _selectionThemeMessage = 'Claro';


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
            ///Container de cambio de idioma
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
                      });
                    },
                  ),
                )
              ],
            ),
            ///Container preferencias alimentarias
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
                    items: _selectedValuesFoodPreferences.map((option) => MultiSelectItem<String>(option, option)).toList(),
                    onConfirm: (selectedItems) {
                      print(selectedItems);
                    },
                  )
                )
              ],
            ),
            ///Container tema de la aplicación
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



