import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:gsb_ap4/model/departement.dart';
import 'package:gsb_ap4/model/medecin.dart';
import 'package:gsb_ap4/model/pays.dart';
import 'package:gsb_ap4/service/service.dart';
import 'profil.dart';


class MedecinsDepScreen extends StatefulWidget {
  const MedecinsDepScreen({Key? key}) : super(key: key);
  static const routeName= '/MedecinDepart';
  @override
  _MedecinsDepScreenState createState() => _MedecinsDepScreenState();
}

class _MedecinsDepScreenState extends State<MedecinsDepScreen> {

  @override
  Widget build(BuildContext context) {
    final args= ModalRoute.of(context)!.settings.arguments as Future<List<Medecin>>;
    return Scaffold(
        appBar: AppBar(
          title: Text('Liste des médecins'),
        ),
        body: Container(
          child: Card(
            child: FutureBuilder<List<Medecin>>(
                future: args,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: Text('Loading...'),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, i) {
                          return ListTile(
                            title: Text(snapshot.data![i].nom+" "+snapshot.data![i].prenom),
                            onTap: (){
                              Navigator.pushNamed(context,MedecinProfil.routeName, arguments: Service().getMedecinByID(snapshot.data![i].id));
                            },
                          );
                        });
                  }}),
          ),
        ));
  }
}