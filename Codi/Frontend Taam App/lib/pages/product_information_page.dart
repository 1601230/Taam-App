import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:taam_app/main.dart';
import 'package:taam_app/pages/ingredient_information_page.dart';
import 'package:taam_app/pages/page_configuration.dart';
import 'package:taam_app/pages/incorrect_form_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taam_app/pages/page_report_product.dart';
import 'package:taam_app/pages/unexistent_advice.dart';
import 'package:taam_app/services/local_storage.dart';
import 'package:google_fonts/google_fonts.dart';


import '../requests.dart';
import '../services/settings_provder.dart';

Future<Map<String, dynamic>> _searchByName(String nameString) async {
  Map<String, dynamic> aux = await searchByName(nameString);
  return aux;
}

Future<List<String>> _changeRestrictionsLanguage(List<String> listPreferences) async {
  Map<String, dynamic> aux = await changeRestrictionsLanguage(listPreferences);
  List<String> resultList = aux.values.toList().map((element) => element.toString()).toList();
  return resultList;
}

///productImage tendrá un formato URL
class MyProductScreen extends StatefulWidget {
  final Map<String, dynamic>? product;
  const MyProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  _MyProductScreen createState() => _MyProductScreen(product!);
}

class _MyProductScreen extends State<MyProductScreen> {
  Map<String, dynamic> product;
  _MyProductScreen(this.product);

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    String? ingredients = product["Ingredients"].substring(1, product["Ingredients"].length - 1);
    String? unsuitableIngredients = product["ListIngredientsUNSUITABLE"].substring(1, product["ListIngredientsUNSUITABLE"].length - 1);
    String? doubtfulIngredients = product["ListIngredientsDOUBTFUL"].substring(1, product["ListIngredientsDOUBTFUL"].length - 1);
    String? image = product["Image"];

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
      if (aptoValue == AppLocalizations.of(context)!.textApto) {
        return Colors.green;
      } else if (aptoValue == AppLocalizations.of(context)!.textDudoso) {
        return Colors.orange;
      } else {
        return Colors.red;
      }
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: 300,
            height: 200,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 300,
                        padding: EdgeInsets.only(bottom: 10.0), // Agrega el padding deseado
                        child: Center(
                          child: Text(
                            product["Name"],
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Image.network(
                      image!,
                      height: 150,
                      width: 150,
                    )
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0), // Agrega el padding deseado
                child: Text(
                  esApto,
                  style: GoogleFonts.lato(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: _getColorForAptoValue(esApto),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.info,
                  color: _getColorForAptoValue(esApto),
                ),
                onPressed: () async {
                  String infoProduct = await _getInfoProduct();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Información'),
                        content: Text(infoProduct),
                        actions: [
                          TextButton(
                            child: Text('Cerrar'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
            thickness: 1.0,
            indent: 45.0,
            endIndent: 45.0,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Text(
                  AppLocalizations.of(context)!.textInfoConsumicion,
                  style: GoogleFonts.lato(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: 300,
                height: 200,
                child: Scrollbar(
                  isAlwaysShown: true,
                  controller: ScrollController(),
                  child: ListView.builder(
                    itemCount: listIngredients?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Icon(Icons.local_dining_outlined, size: 20),
                        title: Text(
                          listIngredients![index],
                          style: GoogleFonts.lato(),
                        ),
                        subtitle: Text(
                          _isSuitable(listIngredients![index]),
                          style: GoogleFonts.lato(
                            color: _getColorForAptoValue(_isSuitable(listIngredients![index])),
                          ),
                        ),
                        onTap: () async {
                          String ingredientTap = listIngredients![index];
                          Map<String, dynamic>? ingredientByNameTap = await _searchByName(ingredientTap);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyIngredientScreen(ingredient: ingredientByNameTap)),
                          );
                        },
                      );
                    },
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PageReportProduct()));
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 4.0), // Ajusta el valor de padding según tus necesidades
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
                  "Reportar", // Ajusta el espaciado según tus necesidades
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
        ],
      ),

    );
  }
}