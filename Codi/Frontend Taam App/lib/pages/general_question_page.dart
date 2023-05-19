import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taam_app/pages/send_doubt_page.dart';
import '../requests.dart';
import 'package:google_fonts/google_fonts.dart';


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
                Text(
                  AppLocalizations.of(context)!.titlePreguntasFrecuentes,
                  style: GoogleFonts.lato(
                    letterSpacing: 1,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("           ")
              ],
            ),
          ),
        ),
        body: FutureBuilder<List<Item>>(
          future: _loadQuestions(),
          builder: (BuildContext context, AsyncSnapshot<List<Item>> snapshot) {
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        _buildPanel(),
                        Divider(
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    color: Colors.white, // Establecer el color de fondo como blanco
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(const Size(150, 50)),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.amber.shade700),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (BuildContext context) => MyDoubt(context))
                          );
                        },
                        child: Text(
                          AppLocalizations.of(context)!.textButtonEnviarDuda,
                          style: GoogleFonts.lato(
                            letterSpacing: 1,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      );
  }
  Widget _buildPanel() {
    return Padding(
      padding: EdgeInsets.only(top: 15.0), // Ajusta el valor de padding según tus necesidades
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
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              );
            },
            body: ListTile(
              title: Padding(
                padding: EdgeInsets.only(bottom: 15.0), // Ajusta el valor de padding según tus necesidades
                child: Text(
                  item.expandedValue,
                  style: GoogleFonts.lato(
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
            isExpanded: item.isExpanded,
          );
        }).toList(),
      ),
    );
  }
}
