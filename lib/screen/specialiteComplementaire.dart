import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:gsb_ap4/service/service.dart';
import 'package:gsb_ap4/model/specialite_complementaire.dart';
import 'medecins_departements.dart';


class SpecialiteScreen extends StatefulWidget {
  const SpecialiteScreen({Key? key}) : super(key: key);

  @override
  _SpecialiteScreenState createState() => _SpecialiteScreenState();
}

class _SpecialiteScreenState extends State<SpecialiteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Add from here...
      appBar: AppBar(

          title: const Center(
            child: Text('Spécialité complémentaire'),
          )),

      body: Card(
        child: FutureBuilder<List<SpecialiteComplementaire>>(
          future: Service().getSpecialite(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                        title: Text(snapshot.data![i].libelle),
                        onTap: () {
                          Navigator.pushNamed(context, MedecinsDepScreen.routeName, arguments: Service().getMedecinBySpecialite(snapshot.data![i]));
                        }
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}