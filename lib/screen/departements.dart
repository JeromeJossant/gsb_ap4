import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:gsb_ap4/service/service.dart';
import 'package:gsb_ap4/model/departement.dart';

import 'medecins_departements.dart';

class DepartementsScreen extends StatefulWidget {
  const DepartementsScreen({Key? key}) : super(key: key);

  @override
  _DepartementsScreenState createState() => _DepartementsScreenState();
}

class _DepartementsScreenState extends State<DepartementsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Départements'),
        ),
        body: Container(
          child: Card(
            child: FutureBuilder<List<Departement>>(
                future: Service().getDepartements(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, i) {
                          return ListTile(
                            title: Text(snapshot.data![i].num +" - "+snapshot.data![i].nom),
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