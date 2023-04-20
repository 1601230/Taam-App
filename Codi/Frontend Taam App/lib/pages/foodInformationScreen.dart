import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:taam_app/pages/reportIncorrectForm.dart';


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
  final String productName;
  final String productImage;
  const MyFoodScreen({Key? key, required this.productName,required this.productImage }) : super(key: key);

  @override
  _MyFoodScreen createState() => _MyFoodScreen();
}

class _MyFoodScreen extends State<MyFoodScreen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FoodScreen',
        home: Scaffold(
          appBar: AppBar(
            //Icono para volver a la pagina anterior
            title: Image.asset(
              'assets/Logo_TaamApp_Home.png',
              fit: BoxFit.contain,
              height: kToolbarHeight,
            ),
            centerTitle: true,
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
                        widget.productImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.restaurant, size: 20),
                        Text(widget.productName),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){},
                      child: SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.asset("assets/almento_foto.jpg")
                      ),
                    ),
                  ]
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  Text("Informació sobre la consumició"),
                  Container(
                    width: 300,
                    height: 200,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black)
                    ),
                    child: ListView.builder(
                      itemCount: myData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: Icon(Icons.restaurant, size: 20),
                          title: Text(myData[index].title),
                          subtitle: Text(myData[index].restrictions),
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
                  child: Image.asset("assets/report.jpg"),
                ),
              )
            ],
          ),

        )
    );

  }
}