import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:miniprojet/pages/authentification.page.dart';
import 'package:miniprojet/pages/contact.page.dart';
import 'package:miniprojet/pages/gallerie.page.dart';
import 'package:miniprojet/pages/home.page.dart';
import 'package:miniprojet/pages/inscription.page.dart';
import 'package:miniprojet/pages/meteo.page.dart';
import 'package:miniprojet/pages/parametres.page.dart';
import 'package:miniprojet/pages/pays.page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = {
    '/inscription': (context) => InscriptionPage(),
    '/authentification': (context) => AuthentificationPage(),
    '/home': (context) => HomePage(),
    '/contact': (context) => ContactePage(),
    '/gallerie': (context) => GalleriePage(),
    '/meteo': (context) => MeteoPage(),
    '/parameters': (context) => ParametresPage(),
    '/pays': (context) => PaysPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
          future: SharedPreferences.getInstance(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              bool conn = snapshot.data?.getBool('connecte') ?? false;
              if (conn) return HomePage();
            }
            return AuthentificationPage();
          }),
      routes: routes,
    );
  }
}
