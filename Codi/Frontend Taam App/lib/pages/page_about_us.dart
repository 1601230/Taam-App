import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taam_app/pages/page_configuration.dart';

import '../services/local_storage.dart';
import '../services/locale_provider.dart';
import '../services/settings_provder.dart';

class PageAboutUs extends StatefulWidget {
  const PageAboutUs({super.key});

  @override
  State<PageAboutUs> createState() => _PageAboutUsState();
}

class _PageAboutUsState extends State<PageAboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppLocalizations.of(context)!.titleSobreNosotros),
              Text("           ")
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(15),
        /// Apartado de nuestra empresa
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 10.0), // Ajusta el valor según tus necesidades
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.textNuestraEmpresa,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(6.0), // Ajusta el valor según tus necesidades
                    child: Text(
                      AppLocalizations.of(context)!.textInfoNuestraEmpresa,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        )
      ),
      ),
    );
  }
}