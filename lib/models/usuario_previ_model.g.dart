// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_previ_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsuariosPrevi _$UsuariosPreviFromJson(Map<String, dynamic> json) {
  return UsuariosPrevi(
    id: json['id'] as String,
    prv: json['prv'] as String,
    nome: json['nome'] as String,
    cargo: json['cargo'] as String,
    gerencia: json['gerencia'] as String,
    diretoria: json['diretoria'] as String,
  );
}

Map<String, dynamic> _$UsuariosPreviToJson(UsuariosPrevi instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prv': instance.prv,
      'nome': instance.nome,
      'cargo': instance.cargo,
      'gerencia': instance.gerencia,
      'diretoria': instance.diretoria,
    };
