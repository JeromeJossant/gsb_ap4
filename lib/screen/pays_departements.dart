import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:gsb_ap4/model/departement.dart';
import 'package:gsb_ap4/model/pays.dart';
import 'package:gsb_ap4/service/service.dart';
import 'medecins_departements.dart';


class PaysDepScreen extends StatefulWidget {
  const PaysDepScreen({Key? key}) : super(key: key);
  static const routeName= '/paysDepart';
  @override
  _PaysDepScreenState createState() => _PaysDepScreenState();
}

class _PaysDepScreenState extends State<PaysDepScreen> {

  @override
  Widget build(BuildContext context) {
    final args= ModalRoute.of(context)!.settings.arguments as Future<List<Departement>>;
    return Scaffold(
        appBar: AppBar(
          title: Text('Départements'),
        ),
        body: Container(
          child: Card(
            child: FutureBuilder<List<Departement>>(
                future: args,
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
                            title: Text(snapshot.data![i].num+" - "+snapshot.data![i].nom),
                            onTap: (){
                              Navigator.pushNamed(context, MedecinsDepScreen.routeName, arguments: Service().getMedecinByDepartement(snapshot.data![i]));
                            },
                          );
                        });
                  }}),
          ),
        ));
  }
}