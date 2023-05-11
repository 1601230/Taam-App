import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:taam_app/main.dart';
import 'package:taam_app/pages/page_configuration.dart';
import 'package:taam_app/pages/incorrect_form_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taam_app/pages/page_report_product.dart';
import 'package:taam_app/pages/unexistent_advice.dart';

import '../requests.dart';

class Ingredients {
  String title;
  String restrictions;
  Ingredients({required this.title, required this.restrictions});
}

Future<Map<String, dynamic>> _searchByName(String nameString) async {
  Map<String, dynamic> aux = await searchByName(nameString);
  return aux;
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
          Text(esApto),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
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
                      onTap: () async {
                        String ingredientTap = listIngredients![index];
                        Map<String, dynamic>? ingredientByName = await _searchByName(ingredientTap);
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=> MyFoodScreen(product: ingredientByName))
                        );
                      },
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