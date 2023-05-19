import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:taam_app/pages/confirm_doubt_page.dart';
import 'package:taam_app/requests.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';


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
              Text(
                AppLocalizations.of(context)!.titleEnviarPregunta,
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    fontSize: 18.0,
                    color: Colors.white
                ), //
              ),
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
                    style: GoogleFonts.lato(
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                    ), //
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: TextFormField(
                      controller: _textController,
                      maxLines: null,
                      maxLength: 500, // Permite múltiples líneas de texto
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: AppLocalizations.of(context)!.textEscibeAqui,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0), // agregar un espacio en blanco por debajo del TextField
                ],
              ),
            ),
        ElevatedButton(
          style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(150, 50)),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.amber.shade700)
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
          child: Text(
            AppLocalizations.of(context)!.textEnviarPregunta,
            style: GoogleFonts.lato(
              letterSpacing: 1,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          )
        ]
      )
     )
    );
  }
}