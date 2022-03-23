// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pays.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pays _$PaysFromJson(Map<String, dynamic> json) => Pays(
      id: json['id'] as int,
      nom: json['nom'] as String,
      departements: (json['departements'] as List<dynamic>?)
          ?.map((e) => Departement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaysToJson(Pays instance) => <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'departements': instance.departements,
    };
