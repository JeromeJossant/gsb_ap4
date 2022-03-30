import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:gsb_ap4/model/medecin.dart';
import 'package:gsb_ap4/screen/accueil.dart';
import 'package:gsb_ap4/screen/pays_departements.dart';
import 'screen/medecins_departements.dart';
import 'screen/profil.dart';
import 'screen/medecins.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Main(),
      routes: {
        MedecinsScreen.routeName: (context) => const MedecinsScreen(),
        MedecinProfil.routeName: (context) => const MedecinProfil(),
        PaysDepScreen.routeName: (context) => const PaysDepScreen(),
        MedecinsDepScreen.routeName: (context) => const MedecinsDepScreen(),
      },
    );
  }
}