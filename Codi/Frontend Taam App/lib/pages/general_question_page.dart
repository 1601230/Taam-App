import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taam_app/pages/page_configuration.dart';
import 'package:taam_app/pages/questions_page.dart';
import 'package:taam_app/pages/send_doubt_page.dart';
import '../main.dart';
import '../services/local_storage.dart';
import '../services/locale_provider.dart';
import '../services/settings_provder.dart';

class Item {
  String headerValue;
  String expandedValue;
  bool isExpanded;

  Item({
    required this.headerValue,
    required this.expandedValue,
    this.isExpanded = false,
  });
}

class GeneralQuestionsPage extends StatefulWidget {
  @override
  State<GeneralQuestionsPage> createState() => _GeneralQuestionsPageState();
}

class _GeneralQuestionsPageState extends State<GeneralQuestionsPage> {
  final List<Item> _items = <Item>[
    Item(
      headerValue: 'Pregunta 1',
      expandedValue: 'Respuesta pregunta 1',
    ),
    Item(
      headerValue: 'Pregunta 2',
      expandedValue: 'Respuesta pregunta 2',
    ),
    Item(
      headerValue: 'Pregunta 3',
      expandedValue: 'Respuesta pregunta 3',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppLocalizations.of(context)!.titlePreguntasFrecuentes),
              Text("           ")
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              _buildPanel(),
              SizedBox(height: 30),
              ElevatedButton(child: Text(AppLocalizations.of(context)!.textButtonEnviarDuda),
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.teal.shade200)
                  ),
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => MyDoubt(context),
                        )
                    );
                  }
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _items[index].isExpanded = !isExpanded;
        });
      },
      children: _items.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
            title: Text(item.expandedValue),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}


