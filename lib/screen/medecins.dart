import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:gsb_ap4/service/service.dart';
import 'package:gsb_ap4/model/medecin.dart';
import 'package:gsb_ap4/model/pays.dart';
import 'profil.dart';

class MedecinsScreen extends StatefulWidget {
  const MedecinsScreen({Key? key}) : super(key: key);
  static const routeName= '/Medecin';

  @override
  _MedecinScreenState createState() => _MedecinScreenState();
}

class _MedecinScreenState extends State<MedecinsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Add from here...
      appBar: AppBar(
          title: const Center(
            child: Text('GSB - Listes des médecins'),
          )),

      body: Card(
        child: FutureBuilder<List<Medecin>>(
          future: Service().getMedecin(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: Text('Chargement...'),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      title: Text(snapshot.data![i].nom +
                          " " +
                          snapshot.data![i].prenom),
                      onTap: () {
                        Navigator.pushNamed(context,MedecinProfil.routeName, arguments: Service().getMedecinByID(snapshot.data![i].id));
                      },
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}