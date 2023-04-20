import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taam_app/pages/foodInformationScreen.dart';
import 'package:taam_app/pages/page_configuration.dart';


class MyData {
  String title;
  String subtitle;

  MyData({required this.title, required this.subtitle});
}

final List<MyData> myData = [
  MyData(title: 'Colacao', subtitle: 'assets/vegan_stamp.png'),
  MyData(title: 'Alimento 2', subtitle: 'assets/glutenfree_stamp.png'),
  MyData(title: 'Alimento 3', subtitle: 'assets/vegan_stamp.png'),
  MyData(title: 'Alimento 4', subtitle: 'assets/Logo_TaamApp.png'),
  MyData(title: 'Alimento 5', subtitle: 'assets/almento_foto.png'),
  MyData(title: 'Alimento 8', subtitle: 'assets/Logo_TaamApp.png'),
  MyData(title: 'Alimento 9', subtitle: 'assets/vegan_stamp.png'),
];

class MySearchProduct extends StatefulWidget {
  const MySearchProduct({super.key});

  @override
  _MySearchProduct createState() => _MySearchProduct();
}

class _MySearchProduct extends State<MySearchProduct> {
  var _productName;
  bool loadingScreen = false;
  bool loadingRecommendations = false;
  final _productController = TextEditingController();
  final _barcodeController = TextEditingController();
  final _focusNodeProduct = FocusNode();
  final _focusNodeBarcode = FocusNode();
  
  @override
  void initState() {
    super.initState();
    _productController.addListener(_updateProductText);
    _barcodeController.addListener(_updateBarcodeText);
  }

  void _updateProductText(){
    setState(() {
      _productName = _productController.text;
    });
  }

  void _updateBarcodeText(){
    setState(() {
      _productName = _productController.text;
    });
  }

  @override
  void dispose() {
    // Limpia el FocusNode cuando el widget se elimina
    _focusNodeProduct.dispose();
    _focusNodeBarcode.dispose();
    super.dispose();
  }

  Future<void> _searchProduct() async {
    setState(() {
      loadingScreen = true;
    });

    // Aquí va la tarea asincrónica de búsqueda de productos o ingredientes
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      loadingScreen = false;
    });
  }

  Future<void> _reloadRecommendations() async {
    setState(() {
      loadingRecommendations = true;
    });

    // Aquí va la tarea asincrónica de búsqueda de productos o ingredientes
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      loadingRecommendations = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
    child: Scaffold(
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
                  Navigator.pop(context);
                  // Aqui se agrega la navegación a la pantalla de inicio
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
      body: Center(
        child: loadingScreen == true ? Center(child: Container(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(),
        ),)
            : Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                children: [
                  TextFormField(
                    controller: _productController,
                    focusNode: _focusNodeProduct,
                    decoration: InputDecoration(
                      hintText: 'Buscar producte/ingredient...',
                      hintStyle: const TextStyle(color: Colors.grey),
                      prefixIcon:  IconButton(
                        onPressed: () {
                          Fluttertoast.showToast(
                              msg: "Product Name is empty",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        },
                        icon: const Icon(Icons.search),
                      ),
                      suffixIcon: _productController.text.isEmpty
                          ? null
                          : InkWell(
                        onTap: () => _productController.clear(),
                        child: const Icon(Icons.clear),
                      ),
                      filled: true,
                      fillColor: Colors.white70,
                      contentPadding: EdgeInsets.all(8),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                      ),
                    ),
                    keyboardType: TextInputType.text,

                    onEditingComplete: () async {
                      _focusNodeProduct.unfocus();
                      await _searchProduct();
                      //_productController.text
                      if (_productController.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Product Name is empty",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      } else {
                        Fluttertoast.showToast(
                            msg: "Product Name is ${_productController.text}",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      controller: _barcodeController,
                      focusNode: _focusNodeBarcode,
                      decoration: InputDecoration(
                        hintText: 'Introduir codi...',
                        hintStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: IconButton(
                          onPressed: () {
                            Fluttertoast.showToast(
                                msg: "Camera clicked",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                          },
                          icon: const Icon(Icons.camera_alt)),
                        suffixIcon: _barcodeController.text.isEmpty
                          ? null
                          : InkWell(
                            onTap: () => _barcodeController.clear(),
                            child: const Icon(Icons.clear),
                        ),
                        filled: true,
                        fillColor: Colors.white70,
                        contentPadding: EdgeInsets.all(8),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      onEditingComplete: () async {
                        _focusNodeBarcode.unfocus();
                        await _searchProduct();
                        if(_productController.text.isEmpty) {
                          Fluttertoast.showToast(
                            msg: "Product Name is empty",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                          );
                        } else {
                          Fluttertoast.showToast(
                              msg: "Product Barcode is ${_barcodeController.text}",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                        //_barcodeController.clear(); //Esto limpia el contenido de la barra de búsqueda
                      },
                    )
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(
                      height: 10, // Altura de la línea
                      thickness: 2, // Grosor de la línea
                      color: Colors.grey, // Color de la línea
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 30.0),
                          child: Text(
                            "Recomanacions",
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _reloadRecommendations();
                          },
                          icon: Icon(Icons.refresh),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: loadingRecommendations == true ? Center(child: Container(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(),
                      ),)
                          : ListView.builder(
                              itemCount: myData.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(vertical: 4.0),
                                  child: GestureDetector(
                                    onTap: () async {
                                      //Añadir navegación a la pantalla del producto
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context)=> MyFoodScreen(productName: myData[index].title, productImage: myData[index].subtitle))
                                      );

                                      await _searchProduct();
                                      /*Fluttertoast.showToast(
                                          msg: "${myData[index].title} Seleccionado",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0
                                      );*/
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey, width: 1.0),
                                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image.asset(
                                            myData[index].subtitle,
                                            width: 100.0,
                                            height: 100.0,
                                          ),
                                          Text(
                                            myData[index].title,
                                            style: const TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(bottom: 2.0, top: 4.0),
                                                child: Image.asset(
                                                  "assets/vegan_stamp.png",
                                                  width: 33.0,
                                                  height: 33.0,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(2.0),
                                                child: Image.asset(
                                                  "assets/glutenfree_stamp.png",
                                                  width: 33.0,
                                                  height: 33.0,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(bottom: 4.0, top: 2.0),
                                                child: Image.asset(
                                                  "assets/vegan_stamp.png",
                                                  width: 33.0,
                                                  height: 33.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
                  )
                ]
            )
        ),
      ),
    ),
    );
  }
}