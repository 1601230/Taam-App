import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:taam_app/main.dart';
import 'package:taam_app/pages/page_configuration.dart';
import 'package:taam_app/pages/reportIncorrectForm.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Ingredients {
  String title;
  String restrictions;
  Ingredients({required this.title, required this.restrictions});
}

///TODO: Como se recupera la lista de ingredientes del producto.
final List<Ingredients> myData = [
  Ingredients(title: 'Ingredient 1',restrictions: 'Apto'),
  Ingredients(title: 'Ingredient 2',restrictions: 'Apto'),
  Ingredients(title: 'Ingredient 3',restrictions: 'Apto'),
  Ingredients(title: 'Ingredient 4',restrictions: 'Apto'),
  Ingredients(title: 'Ingredient 5',restrictions: 'Apto'),
  Ingredients(title: 'Ingredient 6',restrictions: 'Apto'),
  Ingredients(title: 'Ingredient 7',restrictions: 'Apto'),
  Ingredients(title: 'Ingredient 8',restrictions: 'Apto'),
  Ingredients(title: 'Ingredient 9',restrictions: 'Apto'),
  Ingredients(title: 'Ingredient 10',restrictions: 'Apto'),
];

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
    List<String>? listIngredients = ingredients?.split(", ");

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
              Text("Mostrar si es Apto o No"),
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
                          subtitle: Text("Apto"),
                        );
                      },
                    ),


                  )
                ],
              ),
              SizedBox(height: 20),

              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => NonExistentFoodPage()));
                },
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset("assets/glutenfree_stamp.png"),
                ),
              )
            ],
          ),

        );
  }
}