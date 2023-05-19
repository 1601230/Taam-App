import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taam_app/pages/page_configuration.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taam_app/pages/product_reported_properly.dart';
import 'package:google_fonts/google_fonts.dart';


import '../requests.dart';
import '../services/local_storage.dart';
import '../services/locale_provider.dart';
import '../services/settings_provder.dart';

Future<void> _setReportProductText(String textReport) async {
  setReportProductText(textReport);
}

class PageReportProduct extends StatefulWidget {
  const PageReportProduct({super.key});

  @override
  State<PageReportProduct> createState() => _PageReportProductState();
}

class _PageReportProductState extends State<PageReportProduct> {
  var _textReport;
  final _textController = TextEditingController();
  final _focustext = FocusNode();

  @override
  void initState() {
    super.initState();
    _textController.addListener(_updateText);
  }

  void _updateText() {
    setState(() {
      _textReport = _textController.text;
    });
  }

  @override
  void dispose() {
    // Limpia el FocusNode cuando el widget se elimina
    _focustext.dispose();
    super.dispose();
  }

  String textCleaner(String data) {
    data = data.replaceAll("?", ' INTERROGANTEFINAL');
    data = data.replaceAll("¿", 'INTERROGANTEINICIAL ');
    data = data.replaceAll("/", ' BARRASIETE ');
    data = data.replaceAll("\\", ' BARRASIETEINVERTIDA ');

    return data;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(""),
              Text(
                AppLocalizations.of(context)!.titlePaginaReporteProducto,
                style: GoogleFonts.lato(
                  letterSpacing: 1,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("         ")
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///Campo para otros motivos de reporte
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 15, left: 10),
                      child: Text(
                        AppLocalizations.of(context)!.titleOtrosMotivos,
                        style: GoogleFonts.lato(
                          letterSpacing: 0.5,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: _textController,
                        focusNode: _focustext,
                        maxLines: null,
                        maxLength: 500, // Permite múltiples líneas de texto
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: AppLocalizations.of(context)!.textEscribeMotivos,
                        ),
                      ),
                    )
                  ],
                ),
            ///Botón para enviar el reporte al servidor
            Padding(
              padding: EdgeInsets.only(top:10),
              child: Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(150, 50)),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.amber.shade700),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () {
                    String reporteFinal = textCleaner(_textController.text);
                    if(_textController.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg: AppLocalizations.of(context)!.textIntroduceReporte,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    } else {
                      _setReportProductText(reporteFinal);
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=> ProductReportedCorrectlyPage())
                      );
                    }
                  },
                  child: Text(
                    AppLocalizations.of(context)!.textBotonEnviarReporte,
                    style: GoogleFonts.lato(
                      letterSpacing: 1,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      ),
      );
  }

}