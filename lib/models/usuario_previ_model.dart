import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'usuario_previ_model.g.dart';

@JsonSerializable()
class UsuariosPrevi with ChangeNotifier {
  final String id;
  final String prv;
  final String nome;
  final String cargo;
  final String gerencia;
  final String diretoria;

  UsuariosPrevi(
      {this.id,
      this.prv,
      this.nome,
      this.cargo,
      this.gerencia,
      this.diretoria});

  factory UsuariosPrevi.fromJson(Map<String, dynamic> json) =>
      _$UsuariosPreviFromJson(json);
  Map<String, dynamic> toJson() => _$UsuariosPreviToJson(this);
}
