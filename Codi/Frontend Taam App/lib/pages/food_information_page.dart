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

class Ingredients {
  String title;
  String restrictions;
  Ingredients({required this.title, required this.restrictions});
}

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
class MyFoodScreen extends StatefulWidget {
  final Map<String, dynamic>? product;
  const MyFoodScreen({Key? key, required this.product}) : super(key: key);

  @override
  _MyFoodScreen createState() => _MyFoodScreen(product!);
}

class _MyFoodScreen extends State<MyFoodScreen> {
  Map<String, dynamic> product;
  _MyFoodScreen(this.product);

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
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
        //infoCompleta = infoCompleta + "\n${lista[i-1]}: ${AppLocalizations.of(context)!.textNoApto}";
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
          SizedBox(height: 20),
          Container(
            width: 300,
            height: 200,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black)
            ),
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/almento_foto.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.restaurant, size: 20),
                      Text(product["Name"]),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                esApto,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: _getColorForAptoValue(esApto)
                ),
              ),
              IconButton(
                icon: Icon(
                    Icons.info,
                    color: _getColorForAptoValue(esApto),),
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
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(AppLocalizations.of(context)!.textInfoConsumicion),
              ),
              Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black)
                ),
                child: ListView.builder(
                  itemCount: listIngredients?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Icon(Icons.restaurant, size: 20),
                      title: Text(listIngredients![index]),
                      subtitle: Text(_isSuitable(listIngredients![index])),
                    );
                  },
                ),
                  )
                ],
              ),
              SizedBox(height: 20),

          GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => PageReportProduct()));
              },
              child: const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 50,
              )
          )
        ],
      ),

    );
  }
}
