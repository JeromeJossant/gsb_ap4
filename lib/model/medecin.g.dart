// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medecin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Medecin _$MedecinFromJson(Map<String, dynamic> json) => Medecin(
      id: json['id'] as int,
      prenom: json['prenom'] as String,
      nom: json['nom'] as String,
      adresse: json['adresse'] as String,
      tel: json['tel'] as String,
      specialiteComplementaire: json['specialiteComplementaire'],
      departement: json['departement'],
    );

Map<String, dynamic> _$MedecinToJson(Medecin instance) => <String, dynamic>{
      'id': instance.id,
      'prenom': instance.prenom,
      'nom': instance.nom,
      'tel': instance.tel,
      'adresse': instance.adresse,
      'specialiteComplementaire': instance.specialiteComplementaire,
      'departement': instance.departement,
    };
