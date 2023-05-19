import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:taam_app/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taam_app/pages/page_report_product.dart';
import 'package:google_fonts/google_fonts.dart';


import '../requests.dart';
import '../services/settings_provder.dart';

Future<List<String>> _changeRestrictionsLanguage(List<String> listPreferences) async {
  Map<String, dynamic> aux = await changeRestrictionsLanguage(listPreferences);
  List<String> resultList = aux.values.toList().map((element) => element.toString()).toList();
  return resultList;
}

///productImage tendrá un formato URL
class MyIngredientScreen extends StatefulWidget {
  final Map<String, dynamic>? ingredient;
  const MyIngredientScreen({Key? key, required this.ingredient}) : super(key: key);

  @override
  _MyIngredientScreen createState() => _MyIngredientScreen(ingredient!);
}

class _MyIngredientScreen extends State<MyIngredientScreen> {
  Map<String, dynamic> ingredient;
  _MyIngredientScreen(this.ingredient);

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    String infoProduct = "";

    Future<String> _getInfoProduct() async {
      String infoCompleta = "";
      List<String> listPreferences = [];
      for(int i=1; i<settingsProvider.foodPreferences.length+1; i++) {
        listPreferences.add(ingredient["Restriction"+i.toString()]);
      }

      List<String> listPreferencesTranslated = await _changeRestrictionsLanguage(listPreferences);
      String str = listPreferencesTranslated[0].substring(1, listPreferencesTranslated[0].length - 1);
      List<String> lista = str.split(',').map((element) => element.trim()).toList();

      for(int i=1; i<lista.length+1; i++) {
        String restriccionEsApto = ingredient["RestrictionEdible"+i.toString()];
        switch(restriccionEsApto) {
          case "SUITABLE": infoCompleta = infoCompleta + "\n${lista[i-1]}: ${AppLocalizations.of(context)!.textApto}\n"; break;
          case "UNSUITABLE": infoCompleta = infoCompleta + "\n${lista[i-1]}: ${AppLocalizations.of(context)!.textNoApto}\n"; break;
          case "DOUBTFUL": infoCompleta = infoCompleta + "\n${lista[i-1]}: ${AppLocalizations.of(context)!.textDudoso}\n"; break;
          default: break;
        }
      }
      return infoCompleta;
    }

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
              Text("           ")
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        AppLocalizations.of(context)!.textInfoIngrediente,
                        style: GoogleFonts.lato(
                          letterSpacing: 0.5,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.local_dining_outlined,
                          color: Colors.grey,
                          size: 24,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                          child: Text(
                            ingredient["Name"],
                            style: GoogleFonts.lato(
                              color: Colors.teal,
                              letterSpacing: 0.5,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 270, // Ajusta el valor de ancho según tus necesidades
                      child: Divider(
                        color: Colors.black26,
                      ),
                    ),
                  ],
                ),
              ),
              FutureBuilder<String>(
                future: _getInfoProduct(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text("Error al cargar la información");
                  } else {
                    final infoProduct = snapshot.data;

                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.0), // Ajusta el valor de padding según tus necesidades
                      child: Text(
                        infoProduct ?? "",
                        style: GoogleFonts.lato(
                          letterSpacing: 0.5,
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    );
                  }
                },
              ),

            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PageReportProduct()));
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 4.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 35,
                      ),
                    ),
                  ),
                  ),
                Padding(
                  padding: EdgeInsets.only(left: 2.0),
                  child: Text(
                    "Reportar",
                    style: GoogleFonts.lato(
                      letterSpacing: 1.2,
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}