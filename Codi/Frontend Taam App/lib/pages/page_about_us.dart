import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class PageAboutUs extends StatefulWidget {
  const PageAboutUs({super.key});

  @override
  State<PageAboutUs> createState() => _PageAboutUsState();
}

class _PageAboutUsState extends State<PageAboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.titleSobreNosotros,
                style: GoogleFonts.lato(
                  letterSpacing: 1,
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text("           ")
            ],
          ),
        ),
      ),
      body: Scrollbar(
        isAlwaysShown: true,
        child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          /// Apartado de nuestra empresa
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 10.0), // Ajusta el valor según tus necesidades
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context)!.textNuestraEmpresa,
                        style: GoogleFonts.lato(
                          letterSpacing: 0.5,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(6.0), // Ajusta el valor según tus necesidades
                      child: Text(
                        AppLocalizations.of(context)!.textInfoNuestraEmpresa,
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.lato(
                          letterSpacing: 0.5,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context)!.textTitleContacto,
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.lato(
                          letterSpacing: 0.5,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 10.0),
                    child: Center(
                      child: Text(
                        "E-mail: atencionalcliente@taamApp.com",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.lato(
                          letterSpacing: 0.5,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context)!.textTelefono,
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.lato(
                          letterSpacing: 0.5,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          )
        ),
        ),
      ),
    );
  }
}