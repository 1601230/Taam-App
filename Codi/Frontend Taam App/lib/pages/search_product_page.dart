import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:taam_app/pages/ingredient_information_page.dart';
import 'package:taam_app/pages/product_information_page.dart';
import 'package:taam_app/pages/page_configuration.dart';
import 'package:taam_app/pages/unexistent_advice.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taam_app/requests.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:taam_app/services/settings_provder.dart';
import '../main.dart';
import 'package:google_fonts/google_fonts.dart';

///Funciones conectadas a back-end
///---------------------------------------------------------------------------------------------------------------------------------------------
Future<Map<String, dynamic>> _searchProductByBarcode(String barcodeString) async {
  int barcodeInt = int.parse(barcodeString);
  Map<String, dynamic> aux = await searchProductByBarcode(barcodeInt);
  return aux;
}

Future<Map<String, dynamic>> _searchByName(String nameString) async {
  Map<String, dynamic> aux = await searchByName(nameString);
  return aux;
}

Future<List<String>>? _getRecommendations(List<String> listPreferences) async {
  String preferences = listPreferences.join(", ");
  Map<String, dynamic> recommendations = await getReccomendations(preferences);

  List<String> listRecommendations = [];
  for (String value in recommendations.values) {
    value = value.substring(1, value.length - 1); // elimina los corchetes del inicio y fin
    listRecommendations.add(value);
  }

  return listRecommendations;
}

Future<List<String>?> _getRefresh() async {
  Map<String, dynamic> recommendations = await getRefresh();

  List<String> listRecommendations = [];
  for (String value in recommendations.values) {
    value = value.substring(1, value.length - 1); // elimina los corchetes del inicio y fin
    listRecommendations.add(value);
  }

  return listRecommendations;
}

List<String> _getNamesRecommendations(List<String> listRecommendations) {
  List<String> listPartsRecommendations = [];
  List<String> listNamesRecommendations = [];
  for (String parts in listRecommendations) {
    List<String> partsRecommendations = parts.split(", ");
    listPartsRecommendations.addAll(partsRecommendations);
  }
  for (var i=0; i<listPartsRecommendations.length; i+=3) {
    listNamesRecommendations.add(listPartsRecommendations[i]);
  }

  return listNamesRecommendations;
}

List<String> _getImagesRecommendations(List<String> listRecommendations) {
  List<String> listPartsRecommendations = [];
  List<String> listNamesRecommendations = [];
  for (String parts in listRecommendations) {
    List<String> partsRecommendations = parts.split(", ");
    listPartsRecommendations.addAll(partsRecommendations);
  }
  for (var i=2; i<listPartsRecommendations.length; i+=3) {
    listNamesRecommendations.add(listPartsRecommendations[i]);
  }

  return listNamesRecommendations;
}

///---------------------------------------------------------------------------------------------------------------------------------------------

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
  late String scanResult;
  late PageConfiguration settings = new PageConfiguration();
  List<String>? _listRecommentadions = [];
  List<String>? _listNamesRecommendations = [];
  List<String>? _listImagesRecommendations = [];
  List<String> _listNewImages = [];

  @override
  void initState() {
    super.initState();
    _productController.addListener(_updateProductText);
    _barcodeController.addListener(_updateBarcodeText);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadRecommendations();
  }

  Future<void> _loadRecommendations() async {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    List<String>? listRecommendations = await _getRecommendations(settingsProvider.foodPreferences);
    List<String> listNameRecommendations = _getNamesRecommendations(listRecommendations!);
    List<String> listImagesRecommendations = _getImagesRecommendations(listRecommendations!);
    setState(() {
      _listRecommentadions = listRecommendations;
      _listNamesRecommendations = listNameRecommendations;
      _listImagesRecommendations = listImagesRecommendations;
    });
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

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
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
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context)=> MyHomePage()),
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
                      hintText: AppLocalizations.of(context)!.textBuscadorProducto,
                      hintStyle: const TextStyle(color: Colors.grey),
                      prefixIcon:  IconButton(
                        onPressed: () {

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
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                    ),
                    keyboardType: TextInputType.text,

                    onEditingComplete: () async {
                        _focusNodeProduct.unfocus();

                      if (_productController.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: AppLocalizations.of(context)!.textProductNameVacio,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      } else {
                        Map<String, dynamic>? productByName = await _searchByName(_productController.text);

                        if (productByName.isEmpty) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context)=> NoExistentScreen())
                          );
                        } else if(productByName.containsKey("Barcode")){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context)=> MyProductScreen(product: productByName))
                          );
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context)=> MyIngredientScreen(ingredient: productByName))
                          );
                        }
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      controller: _barcodeController,
                      focusNode: _focusNodeBarcode,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.textBuscadorProducto,
                        hintStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: IconButton(
                          onPressed: () async {
                            String scannedBarcode = await scanBarcode();
                            Map<String, dynamic>? productScanned = await _searchProductByBarcode(scannedBarcode);

                            if (productScanned.isEmpty) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context)=> NoExistentScreen())
                              );
                            } else{
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context)=> MyProductScreen(product: productScanned))
                              );
                            }
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
                          borderSide: BorderSide(color: Colors.grey, width: 1)
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      onEditingComplete: () async {
                        _focusNodeBarcode.unfocus();

                        if (_barcodeController.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: AppLocalizations.of(context)!.textBarcodeVacio,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        } else {
                          Map<String, dynamic>? productByBarcode = await _searchProductByBarcode(_barcodeController.text);

                          if (productByBarcode.isEmpty) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context)=> NoExistentScreen())
                            );
                          } else{
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context)=> MyProductScreen(product: productByBarcode))
                            );
                          }
                        }
                        },
                    )
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(
                      height: 10, // Altura de la línea
                      thickness: 1, // Grosor de la línea
                      color: Colors.grey, // Color de la línea
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Text(
                            AppLocalizations.of(context)!.titleRecomendaciones,
                            style: GoogleFonts.lato(
                              letterSpacing: 0.5,
                              color: Colors.black87,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          iconSize: 30,
                          onPressed: () async {
                            setState(() {
                              loadingRecommendations = true;
                            });

                            _listRecommentadions = await _getRefresh();
                            _listNamesRecommendations = _getNamesRecommendations(_listRecommentadions!);
                            _listImagesRecommendations = _getImagesRecommendations(_listRecommentadions!);

                            setState(() {
                              loadingRecommendations = false;
                            });
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
                              itemCount: _listRecommentadions?.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(vertical: 4.0),
                                  child: GestureDetector(
                                    onTap: () async {
                                      _focusNodeBarcode.unfocus();
                                      _focusNodeProduct.unfocus();
                                      String productTap = _listNamesRecommendations![index];
                                      Map<String, dynamic>? productByNameTap = await _searchByName(productTap);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context)=> MyProductScreen(product: productByNameTap))
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: BorderDirectional(
                                          bottom: BorderSide(color: Colors.black12, width: 1.0),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(10.0), // Ajusta el valor de padding según tus necesidades
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Image.network(
                                                _listImagesRecommendations![index],
                                                height: 100,
                                                width: 100,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              //alignment: Alignment.center,
                                              padding: EdgeInsets.all(10.0),
                                              child: Text(
                                                _listNamesRecommendations![index],
                                                softWrap: true,
                                                style: GoogleFonts.lato(
                                                  fontSize: 16.0,
                                                  //fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
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

  Future scanBarcode() async {
    scanResult = await FlutterBarcodeScanner.scanBarcode(
        "#4fb9af", //Color de la linia de escaneo
        AppLocalizations.of(context)!.textCancelarDialog, //Texto del botón cancelar
        true, //Mostrar o no mostrar icono de flash
        ScanMode.BARCODE //El tipo de código que queremos leer
    );
    return scanResult;
  }
}