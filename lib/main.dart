import 'package:flutter/material.dart';
import 'package:schulte_table/components/home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MaterialApp(
    title: 'Schulte Table App',
    theme: ThemeData(brightness: Brightness.dark, primarySwatch: Colors.orange),
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
    },
    localizationsDelegates: [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: [
      const Locale('en', ''),
    ],
  ));
}
