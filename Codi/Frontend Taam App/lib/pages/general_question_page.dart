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
Preguntas(question: 'Es mi hamster comestible?'),
Preguntas(question: 'Cuanta proteína contiene una paloma ?'),
Preguntas(question: 'Comer es vegano ?'),
  Preguntas(question: 'Ser vegano vale la pena ?'),
  Preguntas(question: 'Estudiar vale la pena ?'),
  Preguntas(question: 'Cual es el sentido de la vida ?'),
  Preguntas(question: ' Kings league el domingo?'),
  Preguntas(question: ' Kings league el domingo?'),
  Preguntas(question: ' Kings league el domingo?'),
  Preguntas(question: ' Kings league el domingo?'),
  Preguntas(question: ' Kings league el domingo?'),
  Preguntas(question: ' Kings league el domingo?'),
  Preguntas(question: ' Kings league el domingo?'),Preguntas(question: ' Kings league el domingo?'),
  Preguntas(question: ' Kings league el domingo?'),

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

                    SizedBox(height: 50,),
                    Text(AppLocalizations.of(context)!.textPreguntas, style: TextStyle(fontSize: 30),),
                    SizedBox(height: 35,),

                    Container(
                      width: 300,
                      height: 400,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)
                      ),
                      child: ListView.builder(
                        itemCount: myQuestions.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyQuestions(
                                      question: myQuestions[index].question
                                  ),
                                ),
                              );
                            },
                            child: ListTile(
                              leading: Icon(Icons.question_answer, size: 20),
                              title: Text(myQuestions[index].question),
                            ),
                          );
                        },
                      ),
                    ),


                    SizedBox(height: 30),
                    ElevatedButton(child: Text("Enviar dubte"),
                        style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.grey)
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

                )

            ),
          ),
    );
  }
}