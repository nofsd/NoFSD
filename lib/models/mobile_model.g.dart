// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MobileModel _$MobileModelFromJson(Map<String, dynamic> json) {
  return MobileModel(
    id: json['id'] as String,
    modelo: json['modelo'] as String,
    marca: json['marca'] as String,
    imei: json['imei'] as String,
    vouncher: json['vouncher'] as String,
    tradeIn: json['tradeIn'] as String,
    usuario: json['usuario'] as String,
    prv: json['prv'] as String,
    operadora: json['operadora'] as String,
    pin: json['pin'] as String,
    numero: json['numero'] as String,
    ddd: json['ddd'] as String,
    pais: json['pais'] as String,
    dataLocacao: json['dataLocacao'] as String,
    dataDevolucao: json['dataDevolucao'] as String,
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$MobileModelToJson(MobileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'modelo': instance.modelo,
      'marca': instance.marca,
      'imei': instance.imei,
      'vouncher': instance.vouncher,
      'tradeIn': instance.tradeIn,
      'usuario': instance.usuario,
      'prv': instance.prv,
      'operadora': instance.operadora,
      'pin': instance.pin,
      'numero': instance.numero,
      'ddd': instance.ddd,
      'pais': instance.pais,
      'dataLocacao': instance.dataLocacao,
      'dataDevolucao': instance.dataDevolucao,
      'status': instance.status,
    };
