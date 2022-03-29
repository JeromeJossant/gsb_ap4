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

class DataFromAPI extends StatefulWidget {
  const DataFromAPI({Key? key}) : super(key: key);

  @override
  _DataFromAPIState createState() => _DataFromAPIState();
}

class _DataFromAPIState extends State<DataFromAPI> {
  Future<List<Medecin>> getMedecin() async {
    var response =
    await http.get(Uri.parse('http://localhost:8080/api/v1/medecins'));
    var jsonData = jsonDecode(response.body) as List;
    List<Medecin> medecins = [];
    for (var u in jsonData) {
      medecins.add(Medecin.fromJson(u));
    }
    print(medecins.length);
    return medecins;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Liste des médecins')),
        body: Container(
          child: Card(
            child: FutureBuilder<List<Medecin>>(
                future: getMedecin(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                      child: Center(
                        child: Text('Loading...'),
                      ),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, i) {
                          return ListTile(
                            title: Text(snapshot.data![i].prenom+" "+snapshot.data![i].nom),
                          );
                        });
                  }}),
          ),
        ));
  }
}