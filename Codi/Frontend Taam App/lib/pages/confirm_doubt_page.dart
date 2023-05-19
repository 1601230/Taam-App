import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';
import 'general_question_page.dart';

class ConfirmDoubtAdvice extends StatelessWidget{

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
                  color: Colors.green.shade400,
                  border: Border.all(color: Colors.green, width: 3.0),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.textEnviado,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        letterSpacing: 0.5,
                        fontSize: 18.0,
                        color: Colors.white
                    ), // Aplica la fuente deseada
                  )
                ],
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(150, 50)),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.amber.shade700)
              ),
              onPressed: (){
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context)=> GeneralQuestionsPage()),
                        (route)=>route.isFirst
                );
              },
              child: Text(
                AppLocalizations.of(context)!.textVolverPaginaPreguntas,
                style: GoogleFonts.lato(
                  letterSpacing: 1,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )
              )
            )
          ]
      ),
    );
  }
}