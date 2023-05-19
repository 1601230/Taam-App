import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taam_app/pages/search_product_page.dart';
import '../main.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductReportedCorrectlyPage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
              Text("")
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
                  Padding(
                    padding: EdgeInsets.all(10.0), // Ajusta el padding según tus necesidades
                    child: Text(
                      AppLocalizations.of(context)!.textProductoReported,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                          letterSpacing: 0.5,
                          fontSize: 18.0,
                          color: Colors.white
                      ), // Aplica la fuente deseada
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0), // Ajusta el padding según tus necesidades
                    child: Text(
                      AppLocalizations.of(context)!.textAvisoProductoAnadido,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                          letterSpacing: 0.5,
                          fontSize: 18.0,
                          color: Colors.white
                      ), // Aplica la fuente deseada
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0), // Ajusta el padding según tus necesidades
                    child: Text(
                      AppLocalizations.of(context)!.textGracias,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                          letterSpacing: 0.5,
                          fontSize: 18.0,
                          color: Colors.white
                      ), // Aplica la fuente deseada
                    ),
                  ),
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
                    MaterialPageRoute(builder: (context)=> MySearchProduct()),
                        (route)=>route.isFirst
                );
              },
              child: Text(
                AppLocalizations.of(context)!.textVolverBuscador,
                style: GoogleFonts.lato(
                  letterSpacing: 1,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
         ]
      ),
    );
  }
}
