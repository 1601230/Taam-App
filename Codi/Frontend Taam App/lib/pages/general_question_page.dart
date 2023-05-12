import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taam_app/pages/page_configuration.dart';
import 'package:taam_app/pages/questions_page.dart';
import 'package:taam_app/pages/send_doubt_page.dart';
import '../main.dart';
import '../requests.dart';
import '../services/local_storage.dart';
import '../services/locale_provider.dart';
import '../services/settings_provder.dart';

class Item {
  String headerValue;
  String expandedValue;
  bool isExpanded;

  Item({
    this.headerValue = "",
    this.expandedValue = "",
    this.isExpanded = false,
  });
}

Future<List<String>> _getQuestions() async {
  Map<String, dynamic> preguntas = await getQuestions();
  List<String> listaPreguntas = [];
  for(int i=1; i<preguntas.length+1; i++) {
    listaPreguntas.add(preguntas["${i}"]);
  }
  return listaPreguntas;
}

Future<String> _getAnswers(int index) async {
  Map<String, dynamic> respuestas = await getAnswer(index+1);

  return respuestas["Answer"];
}

class GeneralQuestionsPage extends StatefulWidget {
  @override
  State<GeneralQuestionsPage> createState() => _GeneralQuestionsPageState();
}

class _GeneralQuestionsPageState extends State<GeneralQuestionsPage> {
  List<String> preguntas = [];
  String respuesta = "";
  List<Item> _itemsList = [];
  int contador = 0;

  Future<List<Item>> _loadQuestions() async {
    contador++;
    if(contador == 1) {
      preguntas.clear();
      _itemsList.clear();
      preguntas = await _getQuestions();
      for (int i = 0; i < preguntas.length; i++) {
        respuesta = await _getAnswers(i);
        if(_itemsList.length != preguntas.length) {
          var item = Item(
            headerValue: preguntas[i].replaceAll("Â¿", "¿"),
            expandedValue: respuesta,
          );
          _itemsList.add(item);
        }
      }
    }
    return _itemsList;
  }

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
        body: FutureBuilder<List<Item>>(
          future: _loadQuestions(),
          builder: (BuildContext context, AsyncSnapshot<List<Item>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error loading questions'),
              );
            } else {
              return SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ExpansionPanelList(
                          expansionCallback: (int index, bool isExpanded) {
                            setState(() {
                              _itemsList[index].isExpanded = !isExpanded;
                            });
                          },
                          children: _itemsList.map<ExpansionPanel>((Item item) {
                            return ExpansionPanel(
                              headerBuilder: (BuildContext context, bool isExpanded) {
                                return ListTile(
                                  title: Text(
                                    item.headerValue,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                              },
                              body: ListTile(
                                title: Text(item.expandedValue),
                              ),
                              isExpanded: item.isExpanded,
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        child: Text(AppLocalizations.of(context)!.textButtonEnviarDuda),
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.teal.shade200),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (BuildContext context) => MyDoubt(context)),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      );
    }
  }


