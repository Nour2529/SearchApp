import 'package:flutter/material.dart';
class GlobalParams {
  static List<Map<String, dynamic>>menus= [
      {"title": "Accueil", "icon": Icon (Icons. home, color: Colors. blue, ) , "route":"/home" },
      {"title": "Météo", "icon": Icon (Icons. sunny_snowing, color: Colors.blue, ) ,"route": "/meteo"},
      {"title": "Gallerie", "icon": Icon (Icons.photo, color:Colors.blue, ) ,"route": "/gallerie"},
      {"title": "Pays", "icon": Icon (Icons. location_city, color: Colors. blue, ) ,"route": "/pays"},
      {"title": "Contact", "icon" : Icon (Icons.contact_page, color: Colors. blue, ) ,"route": "/contact"},
      {"title": "Paramètres", "icon": Icon (Icons. settings, color:Colors. blue, ) ,"route": "/parameters"},
      {"title": "Déconnexion", "icon": Icon (Icons. logout, color: Colors. blue, ) , "route": "/authentification"},
      ];
  static List<Map<String,dynamic>>homes=[
    {"title": "Météo","image":"images/meteo.png","route":"/meteo"},
    {"title": "Gallerie","image":"images/gallerie.png","route":"/gallerie"},
    {"title": "Pays","image":"images/pays.png","route":"/pays"},
    {"title": "Contact","image":"images/contact.png","route":"/contact"},
    {"title": "Paramètres","image":"images/parametres.png","route":"/parameters"},
    {"title": "Déconnexion","image":"images/deconnexion.png","route":"/authentification"},
  ];
}