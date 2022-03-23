import 'package:json_annotation/json_annotation.dart';
import 'package:medecin_gsb/model/medecin.dart';

part 'specialite_complementaire.g.dart';

@JsonSerializable()
class SpecialiteComplementaire {
  int id;
  String libelle;
  List<Medecin>? medecins;

  SpecialiteComplementaire({required this.id, required this.libelle, this.medecins});

  factory SpecialiteComplementaire.fromJson(Map<String, dynamic> json) =>
      _$SpecialiteComplementaireFromJson(json);

  Map<String, dynamic> toJson() => _$SpecialiteComplementaireToJson(this);
}
