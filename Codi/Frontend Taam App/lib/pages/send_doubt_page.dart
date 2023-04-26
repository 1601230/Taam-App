import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:taam_app/pages/page_configuration.dart';
import 'package:taam_app/pages/incorrect_form_page.dart';
import 'package:taam_app/pages/search_product_page.dart';

import '../main.dart';



class MyDoubt extends StatefulWidget {
  @override
  _SendDoubtPage createState() => _SendDoubtPage();
}


class _SendDoubtPage extends State<MyDoubt>{

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
      body: Padding(
        padding: EdgeInsets.all(16.0), // ajustar el valor del relleno según sea necesario
        child: Column(
          children: <Widget>[
            SizedBox(height: 16.0), // agregar un espacio en blanco por encima del TextField
            TextField(
              onChanged: (text) {
                setState(() {
                  _text = text;
                });
              },
            ),
            SizedBox(height: 16.0), // agregar un espacio en blanco por debajo del TextField
            if (_text.isNotEmpty) Text(_text),
          ],
        ),
      ),
    );
  }
}