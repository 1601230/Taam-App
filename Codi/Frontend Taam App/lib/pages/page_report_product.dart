import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taam_app/pages/page_configuration.dart';

import '../services/local_storage.dart';
import '../services/locale_provider.dart';
import '../services/settings_provder.dart';

class PageReportProduct extends StatefulWidget {
  const PageReportProduct({super.key});

  @override
  State<PageReportProduct> createState() => _PageReportProductState();
}

class _PageReportProductState extends State<PageReportProduct> {
  List<String> _selectedTypePreference = [];
  List<String> _valuesFoodPreferences = [];

  @override
  Widget build(BuildContext context) {
    ///Asignamos los tipos de incoherencias alimentarias
    _valuesFoodPreferences.clear();
    _valuesFoodPreferences.add(AppLocalizations.of(context)!.textVegetarianoDialog);
    _valuesFoodPreferences.add(AppLocalizations.of(context)!.textVeganoDialog);
    _valuesFoodPreferences.add(AppLocalizations.of(context)!.textCeliacoDialog);

    return Scaffold(
      appBar: AppBar(
          title: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(""),
                  Text(AppLocalizations.of(context)!.titlePaginaReporteProducto),
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
      body: Container(
        margin: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Campo para seleccionar el tipo de reporte de alimento
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                      AppLocalizations.of(context)!.titleTipoReporteAlimento,
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: MultiSelectDialogField(
                      title: Text(
                          AppLocalizations.of(context)!.textSeleccionPreferenciasIncorrectas),
                      buttonText: Text(AppLocalizations.of(context)!.textSeleccionPreferenciasIncorrectas),
                      confirmText: const Text('Confirmar'),
                      cancelText: const Text('Cancelar'),
                      initialValue: _selectedTypePreference,
                      items: _valuesFoodPreferences.map((option) =>
                          MultiSelectItem<String>(option, option))
                          .toList(),
                      onConfirm: (selectedItems) async {
                        ///No tiene que hacer nada, ya que la petición se enviará al servidor cuando se le de al botón de reportar el alimento
                      },
                    )
                )
              ],
            ),
            ///Campo para otros motivos de reporte
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      AppLocalizations.of(context)!.titleOtrosMotivos,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: AppLocalizations.of(context)!.textEscribeMotivos,
                      ),
                    ),
                  )
                ]
            ),
            ///Botón para enviar el reporte al servidor
            Padding(
              padding: EdgeInsets.only(top:10),
              child: Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(150, 50))
                  ),
                  onPressed: () {
                      //TODO: Enviar datos al server
                  },
                  child: Text( AppLocalizations.of(context)!.textBotonEnviarReporte),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}