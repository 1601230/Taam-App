import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:taam_app/main.dart';
import 'package:taam_app/pages/page_configuration.dart';
import 'package:taam_app/pages/incorrect_form_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taam_app/pages/page_report_product.dart';
import 'package:taam_app/pages/unexistent_advice.dart';
import 'package:taam_app/services/local_storage.dart';

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
    /*String? ingredients = product["Ingredients"].substring(1, product["Ingredients"].length - 1);

    List<String>? listIngredients = ingredients?.split(", ");*/

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
              Text("        ")
            ],
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Divider(height: 1, thickness: 2),
          Padding(
              padding: EdgeInsets.only(top: 32.0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      AppLocalizations.of(context)!.textInfoIngrediente,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      ingredient["Name"],
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ), // Espacio flexible para empujar el texto "hola" hacia abajo
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
                padding: EdgeInsets.only(top: 20.0,right: 140),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    infoProduct ?? "",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              );
            }
          },
        ),
          Spacer(),
          Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 24.0), // Ajusta el valor de padding bottom según tus necesidades
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PageReportProduct()));
                },
                child: Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 50,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}









/*final settingsProvider = Provider.of<SettingsProvider>(context);
    String? ingredients = product["Ingredients"].substring(1, product["Ingredients"].length - 1);
    String? unsuitableIngredients = product["ListIngredientsUNSUITABLE"].substring(1, product["ListIngredientsUNSUITABLE"].length - 1);
    String? doubtfulIngredients = product["ListIngredientsDOUBTFUL"].substring(1, product["ListIngredientsDOUBTFUL"].length - 1);

    List<String>? listIngredients = ingredients?.split(", ");
    List<String>? listUnsuitableIngredients = unsuitableIngredients?.split(", ");
    List<String>? listDoubtfulIngredients = doubtfulIngredients?.split(", ");

    late String esApto;
    if (product["Edible"] == "SUITABLE") {
      esApto = AppLocalizations.of(context)!.textApto;
    } else if(product["Edible"] == "UNSUITABLE"){
      esApto = AppLocalizations.of(context)!.textNoApto;
    } else {
      esApto = AppLocalizations.of(context)!.textDudoso;
    }

    String _isSuitable(String ingredient) {
      String isSuitable = "";
      for(var listUnsuitableIngredient in listUnsuitableIngredients!) {
        if(listUnsuitableIngredient == ingredient) {
          return AppLocalizations.of(context)!.textNoApto;
        }
      }
      for(var listDoubtfulIngredient in listDoubtfulIngredients!) {
        if(listDoubtfulIngredient == ingredient) {
          return AppLocalizations.of(context)!.textDudoso;
        }
      }
      return AppLocalizations.of(context)!.textApto;
    }

    Future<String> _getInfoProduct() async {
      String infoCompleta = "";
      List<String> listPreferences = [];
      for(int i=1; i<settingsProvider.foodPreferences.length+1; i++) {
        listPreferences.add(product["Restriction"+i.toString()]);
      }

      List<String> listPreferencesTranslated = await _changeRestrictionsLanguage(listPreferences);
      String str = listPreferencesTranslated[0].substring(1, listPreferencesTranslated[0].length - 1);
      List<String> lista = str.split(',').map((element) => element.trim()).toList();

      for(int i=1; i<lista.length+1; i++) {
        String restriccionEsApto = product["RestrictionEdible"+i.toString()];
        switch(restriccionEsApto) {
          case "SUITABLE": infoCompleta = infoCompleta + "\n${lista[i-1]}: ${AppLocalizations.of(context)!.textApto}\n"; break;
          case "UNSUITABLE": infoCompleta = infoCompleta + "\n${lista[i-1]}: ${AppLocalizations.of(context)!.textNoApto}\n"; break;
          case "DOUBTFUL": infoCompleta = infoCompleta + "\n${lista[i-1]}: ${AppLocalizations.of(context)!.textDudoso}\n"; break;
          default: break;
        }
      }
      return infoCompleta;
    }

    Color _getColorForAptoValue(String aptoValue) {
      if (aptoValue == 'Apto') {
        return Colors.green;
      } else if (aptoValue == 'Dudoso') {
        return Colors.orange;
      } else {
        return Colors.red;
      }
    }*/