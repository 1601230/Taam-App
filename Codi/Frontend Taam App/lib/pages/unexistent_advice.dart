import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:taam_app/pages/page_configuration.dart';
import 'package:taam_app/pages/incorrect_form_page.dart';
import 'package:taam_app/pages/product_reported_properly.dart';
import 'package:taam_app/pages/requestSendAdvice.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../main.dart';
import '../requests.dart';

Future<void> _setReportedProduct() async {
  setReportedProduct();
}

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
          alignment: Alignment.center,
          icon: Image.asset('assets/Logo_TaamApp_Home.png'),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context)=> MyApp()),
                    (route)=>route.isFirst
            );
          },
        ),
        Text("        ")
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
                      border: Border.all(color: Colors.red, width: 3.0),
                      borderRadius: BorderRadius.all(Radius.circular(20))

                  ),


                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('ERROR'),
                      Text(''),
                      Text(
                        AppLocalizations.of(context)!.textProductoNoExiste,
                        textAlign: TextAlign.center,
                      )
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
                    _setReportedProduct();
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=> ProductReportedCorrectlyPage())
                    );
                  },
                  child: Text(AppLocalizations.of(context)!.textReportarProducto),)
              ]
          ),
        );
  }
}
