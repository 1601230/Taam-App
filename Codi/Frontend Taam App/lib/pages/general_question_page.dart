import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taam_app/pages/page_configuration.dart';

import '../main.dart';
import '../services/local_storage.dart';
import '../services/locale_provider.dart';
import '../services/settings_provder.dart';


class GeneralQuestionsPage extends StatelessWidget {

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
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => MyHomePage()),
                              (route) => route.isFirst
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PageConfiguration()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}