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


class Preguntas {

  String question;
  Preguntas({required this.question});

}

final List<Preguntas> myQuestions = [
Preguntas(question: 'Hola como estas ?'),
Preguntas(question: 'Que tal el examen ?'),
Preguntas(question: 'Buenos días ?')
];



class GeneralQuestionsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(""),
                  IconButton(
                    alignment: Alignment.topCenter,
                    icon: Image.asset('assets/Logo_TaamApp_Home.png'),
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => MyHomePage()),
                              (route) => route.isFirst
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PageConfiguration()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
            body: Center(

                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    SizedBox(height: 25,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Questions()),
                      );
                    },
                    child:Container(
                      width: 300,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: Center(
                        child: Text(
                          'Pregunta 1',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                    SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Question()),
                        );
                      },
                      child:Container(
                        width: 300,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: Center(
                          child: Text(
                            'Pregunta 2',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Question()),
                        );
                      },
                      child:Container(
                        width: 300,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: Center(
                          child: Text(
                            'Pregunta 3',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(child: Text("Enviar dubte"),
                        style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.grey)
                        ),
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (BuildContext context) => SendDoubtPage(context),
                              )
                          );
                        }
                    )
                  ],

                )

            ),
          ),
    );
  }
}