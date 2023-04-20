import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:taam_app/pages/page_configuration.dart';
import 'package:taam_app/pages/reportIncorrectForm.dart';

class NoExistentScreen extends StatelessWidget{

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
                      Navigator.pop(context);
                      // Aqui se agrega la navegación a la pantalla de inicio
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
              children: <Widget>[
                Divider(height: 1, thickness: 2),
                SizedBox(height: 100),
                Container(
                  width: 300,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      border: Border.all(color: Colors.red, width: 3.0)

                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('ERROR'),
                      Text('El producte introduït no es troba a la aplicació')
                    ],
                  ),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.red)
                  ),
                  onPressed: (){
                    /* TODO */
                  },
                  child: Text("Reportar Producte"),)
              ]
          ),
        );
  }
}
