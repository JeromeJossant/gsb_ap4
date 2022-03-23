import 'package:json_annotation/json_annotation.dart';

import 'departement.dart';

part 'pays.g.dart';

@JsonSerializable()
class Pays {
  int id;
  String nom;
  List<Departement>? departements;

  Pays({required this.id, required this.nom, this.departements});

  factory Pays.fromJson(Map<String, dynamic> json) => _$PaysFromJson(json);

  Map<String, dynamic> toJson() => _$PaysToJson(this);
}
