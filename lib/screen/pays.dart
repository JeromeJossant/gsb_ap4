import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:gsb_ap4/model/pays.dart';
import 'package:gsb_ap4/service/service.dart';
import 'package:gsb_ap4/screen/pays_departements.dart';


class PaysScreen extends StatefulWidget {
  const PaysScreen({Key? key}) : super(key: key);

  @override
  _PaysScreenState createState() => _PaysScreenState();
}

class _PaysScreenState extends State<PaysScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pays'),
          /*  leading: BackButton(
            color: Colors.white
        ), */),
        body: Container(
          child: FutureBuilder<List<Pays>>(
                future: Service().getPays(),
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
                            title: Text(snapshot.data![i].nom),
                            leading: Icon(Icons.south_america),
                            onTap: (){
                              Navigator.pushNamed(context, PaysDepScreen.routeName, arguments: Service().getDepartementsPays(snapshot.data![i]));

                            },
                          );
                        });
                  }}),
        ));
  }
}