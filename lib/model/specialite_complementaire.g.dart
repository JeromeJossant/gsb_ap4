// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialite_complementaire.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecialiteComplementaire _$SpecialiteComplementaireFromJson(
        Map<String, dynamic> json) =>
    SpecialiteComplementaire(
      id: json['id'] as int,
      libelle: json['libelle'] as String,
      medecins: (json['medecins'] as List<dynamic>?)
          ?.map((e) => Medecin.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpecialiteComplementaireToJson(
        SpecialiteComplementaire instance) =>
    <String, dynamic>{
      'id': instance.id,
      'libelle': instance.libelle,
      'medecins': instance.medecins,
    };
