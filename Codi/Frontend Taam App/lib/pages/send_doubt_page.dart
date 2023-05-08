import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:taam_app/pages/page_configuration.dart';
import 'package:taam_app/pages/incorrect_form_page.dart';
import 'package:taam_app/pages/search_product_page.dart';
import 'package:taam_app/pages/confirm_doubt_page.dart';
import '../main.dart';


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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(""),
              IconButton(
                alignment: Alignment.topCenter,
                icon: Image.asset('assets/Logo_TaamApp_Home.png'),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context)=> MyHomePage()),
                          (route)=>route.isFirst
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageConfiguration()),
                  );
                },
              ),
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
                  Text("Enviar dubte", style: TextStyle(fontSize: 24.0)),
                  SizedBox(height: 20.0),
                  Divider(),
                  SizedBox(height: 25.0),
                  TextField(
                    maxLength: 200,
                    maxLines: 20,
                    decoration: InputDecoration(
                      hintText: 'Escribe aquí',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16.0), // agregar un espacio en blanco por debajo del TextField

                ],
              ),
            ),
        ElevatedButton(child: Text("Enviar dubte"),
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.grey)
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