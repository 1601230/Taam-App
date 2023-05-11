import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:taam_app/pages/page_configuration.dart';
import 'package:taam_app/pages/incorrect_form_page.dart';
import 'package:taam_app/pages/search_product_page.dart';
import 'package:taam_app/pages/confirm_doubt_page.dart';
import '../main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class MyDoubt extends StatefulWidget {
  @override

  final BuildContext context;
  MyDoubt(this.context);
  SendDoubtPage createState() => SendDoubtPage();
}


class SendDoubtPage extends State<MyDoubt>{

  String _text = '';

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
      body: Column(

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
                  TextField(
                    maxLength: 200,
                    maxLines: 10,
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
            onPressed: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ConfirmDoubtAdvice()));
            }
        )
    ]
      )
            );
  }
}