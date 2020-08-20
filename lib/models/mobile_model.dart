import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mobile_model.g.dart';

@JsonSerializable()
class MobileModel with ChangeNotifier {
  final String id;
  final String modelo;
  final String marca;
  final String imei;
  final String vouncher;
  final String tradeIn;
  final String usuario;
  final String prv;
  final String operadora;
  final String pin;
  final String numero;
  final String ddd;
  final String pais;
  final String dataLocacao;
  final String dataDevolucao;
  final String status;

  MobileModel(
      {this.id,
      @required this.modelo,
      @required this.marca,
      @required this.imei,
      this.vouncher,
      this.tradeIn,
      @required this.usuario,
      @required this.prv,
      @required this.operadora,
      this.pin,
      @required this.numero,
      @required this.ddd,
      this.pais,
      this.dataLocacao,
      this.dataDevolucao,
      this.status});

  factory MobileModel.fromJson(Map<String, dynamic> json) =>
      _$MobileModelFromJson(json);
  Map<String, dynamic> toJson() => _$MobileModelToJson(this);
}
