import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:taam_app/pages/food_information_page.dart';
import 'package:taam_app/pages/page_configuration.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../main.dart';


class _NonExistentFoodPage extends StatelessWidget{

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
                            MaterialPageRoute(builder: (context)=> MyApp()),
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
            body:SingleChildScrollView (
                padding: EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.titleFormProdIncorrecto,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0, color: Colors.black.withOpacity(0.7),
                        ),


                      ),
                      SizedBox(height: 25),
                      Text(
                        AppLocalizations.of(context)!.titleIntroduceNombreForm,
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
                          labelText: AppLocalizations.of(context)!.labelTextNombreProd,

                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        AppLocalizations.of(context)!.titleProporcionaInfoForm,
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
                          labelText: AppLocalizations.of(context)!.labeltextImagenProd,

                        ),
                      ),
                      SizedBox(height: 12),
                      TextField(
                        style: TextStyle(fontSize: 16.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(1.0),),
                          labelText: AppLocalizations.of(context)!.labeltextImagenCodigo,

                        ),
                      ),
                      SizedBox(height: 12),
                      TextField(
                        style: TextStyle(fontSize: 16.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(1.0),),
                          labelText: AppLocalizations.of(context)!.labeltextImagenIngredientes,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        AppLocalizations.of(context)!.titleInfoAdicional,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0, color: Colors.black.withOpacity(0.7),
                        ),
                      ),

                      TextField(
                        style: TextStyle(fontSize: 16.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(1.0),),
                          labelText: AppLocalizations.of(context)!.labeltextInfoAdicional,
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
                            child: Text(AppLocalizations.of(context)!.textBotonEnviarForm),)

                      ),
                    ]
                )
            )
        );
  }



}