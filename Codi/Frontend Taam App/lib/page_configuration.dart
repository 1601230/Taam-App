import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

//Para crear un StatefulWidget automáticamente, poner stful

class PageConfiguration extends StatefulWidget {
  const PageConfiguration({Key? key}) : super(key: key);

  @override
  State<PageConfiguration> createState() => _PageConfigurationState();
}

class _PageConfigurationState extends State<PageConfiguration> {
  List<int> _selectedValuesLanguage = [];

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
      body: ListView(
        children: [
          MultiSelectDialogField( //https://www.youtube.com/watch?v=Ldg_TO988no&ab_channel=dbestech
            items: [

            ],
            onConfirm: (List<Object?> ) {  },
          )
        ],
      ),

    );
  }
}



