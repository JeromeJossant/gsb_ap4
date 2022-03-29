import 'package:json_annotation/json_annotation.dart';
import 'package:gsb_ap4/model/pays.dart';

import 'medecin.dart';
part 'departement.g.dart';

@JsonSerializable()
class Departement{
  int id;
  String nom;
  String num;
  Pays? pays;
  List<Medecin>? medecins;

  Departement({required this.id, required this.nom, required this.num, this.pays,this.medecins});

  factory Departement.fromJson(Map<String, dynamic> json) =>
      _$DepartementFromJson(json);

  Map<String, dynamic> toJson()=> _$DepartementToJson(this);
}