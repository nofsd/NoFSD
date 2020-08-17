import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hack_infor/models/mobile_model.dart';
import 'package:hack_infor/utils/constantes.dart';
import 'package:http/http.dart' as http;

class MobilesProvider with ChangeNotifier {
  final String _baseUrl = '${Constantes.BASE_API_URL}/mobiles';
  List<MobileModel> _itemsMobiles = [];

  String _token;
  String _userId;

  MobilesProvider([this._token, this._userId, this._itemsMobiles = const []]);

  List<MobileModel> get itemsMobile => [..._itemsMobiles];

  int get itemsCount {
    return _itemsMobiles.length;
  }

  //carregar os aparelho dentro de items.
  Future<void> loadMobiles() async {
    final response = await http.get("$_baseUrl.json?auth=$_token");
    Map<String, dynamic> data = json.decode(response.body);
    final favResponse = await http.get(
        "${Constantes.BASE_API_URL}/userFavorites/$_userId.json?auth=$_token");
    final favMap = json.decode(favResponse.body);

    // abaixo ele vai limpar a lista de aparelho para não duplicar a lista ao ser chamada.
    _itemsMobiles.clear();
    if (data != null) {
      data.forEach((mobileId, mobileData) {
        final isFavorite = favMap == null ? false : favMap[mobileId] ?? false;
        _itemsMobiles.add(MobileModel(
          id: mobileId,
          modelo: mobileData['modelo'],
          marca: mobileData['marca'],
          imei: mobileData['imei'],
          usuario: mobileData['usuario'],
          prv: mobileData['prv'],
          operadora: mobileData['operadora'],
          ddd: mobileData['ddd'],
          numero: mobileData['numero'],
        ));
      });
      //print(json.decode(response.body));
      notifyListeners();
    }
    return Future.value();
  }

  // se alguem chama o metódo para add
  Future<void> addMobile(MobileModel newMobile) async {
    //await substitui o then
    final response = await http.post(
      "$_baseUrl.json?auth=$_token",
      body: json.encode({
        'modelo': newMobile.modelo,
        'marca': newMobile.marca,
        'imei': newMobile.imei,
        'usuario': newMobile.usuario,
        'prv': newMobile.prv,
        'operadora': newMobile.operadora,
        'ddd': newMobile.ddd,
        'numero': newMobile.numero,
      }),
    );

    _itemsMobiles.add(MobileModel(
      id: json.decode(response.body)['name'],
      modelo: newMobile.modelo,
      marca: newMobile.marca,
      imei: newMobile.imei,
      usuario: newMobile.usuario,
      prv: newMobile.prv,
      operadora: newMobile.operadora,
      ddd: newMobile.ddd,
      numero: newMobile.numero,
    ));
    //notifyListeners = vai notificar todos os interessados quando o evento for chamado
    notifyListeners();
  }

  Future<void> updateMobile(MobileModel mobile) async {
    if (mobile == null || mobile.id == null) {
      return;
    }
    //linha abaixo encontra o aparelho a ser alterado
    final index = _itemsMobiles.indexWhere((prod) => prod.id == mobile.id);
    if (index >= 0) {
      await http.patch(
        "$_baseUrl/${mobile.id}.json?auth=$_token",
        body: json.encode({
          'modelo': mobile.modelo,
          'marca': mobile.marca,
          'imei': mobile.imei,
          'usuario': mobile.usuario,
          'prv': mobile.prv,
          'operadora': mobile.operadora,
          'ddd': mobile.ddd,
          'numero': mobile.numero,
        }),
      );
      _itemsMobiles[index] = mobile;
      notifyListeners();
    }
  }

  Future<void> deleteMobile(String id) async {
    //linha abaixo encontra o aparelho a ser deletado
    final index = _itemsMobiles.indexWhere((mobile) => mobile.id == id);
    if (index >= 0) {
      final mobile = _itemsMobiles[index];
      _itemsMobiles.remove(mobile);
      notifyListeners();
      final response =
          await http.delete("$_baseUrl/${mobile.id}.json?auth=$_token");
      if (response.statusCode >= 400) {
        _itemsMobiles.insert(index, mobile);
        notifyListeners();
        //throw HttpException('Ocorreu um erro na exclusão do aparelho.');
      }
    }
  }
}
