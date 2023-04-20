import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:taam_app/pages/reportIncorrectForm.dart';

class NoExistentScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context){

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NoExistentScreen',
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title:Center(
                child: Image.asset("assets/taamLogo.jpg", width: 50)
            ),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: (){
                  Navigator.of(context).pop(MaterialPageRoute(builder: (context) => FirstScreen()));
                },
                color: Colors.black
            ),
            actions:<Widget> [

            ],
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => (FormProductScreen())));
                  },
                  child: Text("Reportar Producte"),)
              ]
          ),
        )
    );
  }
}
