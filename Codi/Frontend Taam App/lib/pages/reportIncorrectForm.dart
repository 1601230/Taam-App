import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:taam_app/pages/foodInformationScreen.dart';


class NonExistentFoodPage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FormProductScreen',
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.purple,
              elevation: 0,
            ),
            body:SingleChildScrollView (
                padding: EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Formulari del Producte',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0, color: Colors.black.withOpacity(0.7),
                        ),


                      ),
                      SizedBox(height: 25),
                      Text(
                        'Introdueix el nom del Producte',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0, color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                      SizedBox(height: 5),
                      TextField(
                        style: TextStyle(fontSize: 16.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(1.0),),
                          labelText: 'Nom del producte',

                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Proporciona les següents imatges:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0, color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                      SizedBox(height: 5),
                      TextField(
                        style: TextStyle(fontSize: 16.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(1.0),),
                          labelText: 'Imatge del producte',

                        ),
                      ),
                      SizedBox(height: 12),
                      TextField(
                        style: TextStyle(fontSize: 16.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(1.0),),
                          labelText: 'Imatge de codi de barres',

                        ),
                      ),
                      SizedBox(height: 12),
                      TextField(
                        style: TextStyle(fontSize: 16.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(1.0),),
                          labelText: 'Imatge ingredients',
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Informació adicional:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0, color: Colors.black.withOpacity(0.7),
                        ),
                      ),

                      TextField(
                        style: TextStyle(fontSize: 16.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(1.0),),
                          labelText: 'Informació Adicional',
                        ),
                      ),
                      SizedBox(height: 25),

                      Center(



                          child: ElevatedButton(
                            style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.grey)
                            ),
                            onPressed: (){},
                            child: Text("Enviar formulari"),)

                      ),


                    ]
                )
            )
        )
    );
  }



}