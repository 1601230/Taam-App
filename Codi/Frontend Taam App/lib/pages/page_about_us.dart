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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(""),
              Text(AppLocalizations.of(context)!.titleSobreNosotros),
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
        margin: EdgeInsets.all(15),
        /// Apartado de nuestra empresa
        child: Column(
          children: [
            Column(
              children: [
                Center(
                  child: Text(
                    AppLocalizations.of(context)!.textNuestraEmpresa,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    )
                  ),
                ),
                Center(
                  child: Card(
                    child: Text(
                      AppLocalizations.of(context)!.textInfoNuestraEmpresa,
                      textAlign: TextAlign.justify,
                    ),
                  )
                )
              ],
            ),
            SizedBox(height: 20),
            Column(
              children: [
                Center(
                  child: Text(
                    AppLocalizations.of(context)!.textObjetivo,
                      style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    )
                  ),
                ),
                Center(
                  child: Card(
                    child: Text(
                      AppLocalizations.of(context)!.textInfoObjetivo,
                      textAlign: TextAlign.justify,
                    ),
                  )
                )
              ],
            ),
          ],
        )
      ),
    );
  }
}