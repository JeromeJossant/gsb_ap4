import 'package:json_annotation/json_annotation.dart';
import 'package:gsb_ap4/model/departement.dart';
import 'package:gsb_ap4/model/specialite_complementaire.dart';

part 'medecin.g.dart';

@JsonSerializable()
class Medecin {
  int id;
  String prenom;
  String nom;
  String tel;
  String adresse;
  SpecialiteComplementaire? specialiteComplementaire;
  Departement? departement;

  Medecin({required this.id, required this.prenom, required this.nom, required this.adresse, required this.tel, this.specialiteComplementaire, this.departement});

  factory Medecin.fromJson(Map<String, dynamic> json) =>
      _$MedecinFromJson(json);

  Map<String, dynamic> toJson() => _$MedecinToJson(this);
}
