import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:gsb_ap4/model/medecin.dart';
import 'package:gsb_ap4/service/service.dart';

class MedecinProfil extends StatefulWidget {
  const MedecinProfil({Key? key}) : super(key: key);

  static const routeName = '/medecinProfil';
  @override
  State<MedecinProfil> createState() => _MedecinProfilState();
}

class _MedecinProfilState extends State<MedecinProfil> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute
        .of(context)!
        .settings
        .arguments as Future <Medecin>;
    return Scaffold(
        appBar: AppBar(
          title: Text('Profil du médecin'),
          leading: BackButton(
              color: Colors.white
          ),),
        body: Container(
            child: Card(
                child: FutureBuilder <Medecin>(
                    future: args,
                    builder: (context, snapshot) {
                      if (snapshot.data == null) {
                        return Container(
                          child: Center(
                            child: Text('Loading...'),
                          ),
                        );
                      } else {
                        return ListView(
                            children: [
                              const Icon(Icons.account_circle, size: 150),
                              Container(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(snapshot.data!.prenom,
                                            style: Theme
                                                .of(context)
                                                .textTheme
                                                .headline4),
                                        const Text(" ",
                                            style: TextStyle(fontSize: 30)),
                                        Text(snapshot.data!.nom,
                                            style: Theme
                                                .of(context)
                                                .textTheme
                                                .headline4),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        snapshot.data!.specialiteComplementaire != null
                                            ? Text(
                                          snapshot.data!.specialiteComplementaire!
                                              .libelle,
                                          style:
                                          Theme.of(context).textTheme.subtitle1,
                                        )
                                            : Text(
                                          "Aucune spécialité complémentaire",
                                          style:
                                          Theme.of(context).textTheme.subtitle1,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const Divider(),
                              ListTile(
                                leading: Icon(Icons.place_outlined, color: Theme
                                    .of(context)
                                    .colorScheme
                                    .primary),
                                title: Text(snapshot.data!.adresse),)
                              ,
                              const Divider(),
                              ListTile(
                                leading: Icon(Icons.phone_outlined, color: Theme
                                    .of(context)
                                    .colorScheme
                                    .primary),
                                title: Text(snapshot.data!.tel),
                              ),
                            ]
                        );
                      }
                    }
                )
            )
        )

    );
  }
}