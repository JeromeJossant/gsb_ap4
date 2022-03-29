import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:gsb_ap4/model/departement.dart';
import 'package:gsb_ap4/model/medecin.dart';
import 'package:gsb_ap4/model/pays.dart';

const URLSERVER = 'http://172.31.3.8:8080/api/v1/';


class Service {

  Future<List<Departement>> getDepartements() async {
    var response =
    await http.get(Uri.parse(URLSERVER + 'departements'));
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as List;
    List<Departement> departementList = [];
    for (var u in jsonData) {
      departementList.add(Departement.fromJson(u));
    }
    print(departementList.length);
    return departementList;
  }

  Future<List<Medecin>> getMedecin() async {
    var response =
    await http.get(Uri.parse(URLSERVER + 'medecins'));
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as List;
    List<Medecin> medecinList = [];
    for (var u in jsonData) {
      medecinList.add(Medecin.fromJson(u));
    }
    print(medecinList.length);
    return medecinList;
  }

  Future<List<Pays>> getPays() async {
    var response =
    await http.get(Uri.parse(URLSERVER + 'pays'));
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as List;
    List<Pays> paysList = [];
    for (var u in jsonData) {
      paysList.add(Pays.fromJson(u));
    }
    print(paysList.length);
    return paysList;
  }

  Future<List<Departement>> getDepartementsPays(Pays pays) async {
    var response =
    await http.get(Uri.parse(URLSERVER + 'pays/'+pays.id.toString()));
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    return Pays.fromJson(jsonData).departements!;
  }

  Future<Pays> getPaysDataByID(int id) async {
    var response =
    await http.get(Uri.parse(URLSERVER + 'pays/'+id.toString()));
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    return Pays.fromJson(jsonData);
  }

  Future<List<Medecin>> getMedecinByDepartement(Departement departement) async{
    var response =
    await http.get(Uri.parse(URLSERVER + 'departements/'+departement.id.toString()));
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    return Departement.fromJson(jsonData).medecins!;
  }

  Future<Medecin> getMedecinByID(int id) async {
    var response =
    await http.get(Uri.parse(URLSERVER + 'medecins/'+id.toString()));
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    return Medecin.fromJson(jsonData);
  }
}