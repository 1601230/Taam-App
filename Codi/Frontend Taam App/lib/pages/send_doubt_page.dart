import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:taam_app/pages/page_configuration.dart';
import 'package:taam_app/pages/incorrect_form_page.dart';
import 'package:taam_app/pages/search_product_page.dart';
import 'package:taam_app/pages/confirm_doubt_page.dart';
import 'package:taam_app/requests.dart';
import '../main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<void> _sendQuestion(String question) async {
  sendQuestion(question);
}

class MyDoubt extends StatefulWidget {
  @override

  final BuildContext context;
  MyDoubt(this.context);
  SendDoubtPage createState() => SendDoubtPage();
}


class SendDoubtPage extends State<MyDoubt>{
  var _textReport;
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textController.addListener(_updateText);
  }

  void _updateText() {
    setState(() {
      _textReport = _textController.text;
    });
  }

  String textCleaner(String data) {
    data = data.replaceAll("?", ' INTERROGANTEFINAL');
    data = data.replaceAll("¿", 'INTERROGANTEINICIAL ');
    data = data.replaceAll("/", ' BARRASIETE ');
    data = data.replaceAll("\\", ' BARRASIETEINVERTIDA ');

    return data;
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Enviar Dubte"),
              Text("           ")
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget> [
            Padding(
              padding: EdgeInsets.all(16.0), // ajustar el valor del relleno según sea necesario
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 16.0), // agregar un espacio en blanco por encima del TextField
                  Text(
                      AppLocalizations.of(context)!.textEscribePregunta,
                    style: TextStyle(fontSize: 24.0)
                  ),
                  SizedBox(height: 20.0),
                  Divider(),
                  TextFormField(
                    controller: _textController,
                    maxLength: 200,
                    maxLines: 7,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.textEscibeAqui,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16.0), // agregar un espacio en blanco por debajo del TextField

                ],
              ),
            ),
        ElevatedButton(child: Text(AppLocalizations.of(context)!.titleEnviarPregunta),
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.teal.shade200)
            ),
            onPressed: () {
              String question = textCleaner(_textController.text);
              if (_textController.text.isEmpty) {
                Fluttertoast.showToast(
                    msg: AppLocalizations.of(context)!.textIntroduceReporte,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              } else {
                _sendQuestion(question);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ConfirmDoubtAdvice())
                );
              }
            },
          )
        ]
      )
     )
    );
  }
}