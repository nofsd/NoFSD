import 'package:hack_infor/models/chip_model.dart';

class MobileModel {
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
  final ChipModel chip;

  MobileModel({
    this.id,
    this.modelo,
    this.marca,
    this.imei,
    this.vouncher,
    this.tradeIn,
    this.usuario,
    this.prv,
    this.operadora,
    this.pin,
    this.numero,
    this.ddd,
    this.pais,
    this.chip,
  });
}
