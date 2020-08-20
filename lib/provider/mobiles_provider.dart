import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hack_infor/models/mobile_model.dart';
import 'package:hack_infor/provider/networking.dart';
import 'package:hack_infor/utils/constantes.dart';

class MobilesProvider with ChangeNotifier {
  //final String _baseUrl = '${Constantes.BASE_API_URL}/mobiles';
  final String _baseBack = '${Constantes.BASE_API_BACK}/mobiles';
  List<MobileModel> _itemsMobiles = [];

  String _token;

  MobilesProvider([this._token, this._itemsMobiles = const []]);

  List<MobileModel> get itemsMobile => [..._itemsMobiles];

  int get itemsCount {
    return _itemsMobiles.length;
  }

  Future<void> loadMobiles() async {
    NetworkHelper networkHelper = NetworkHelper("$_baseBack");
    List<dynamic> data = await networkHelper.getData();
    _itemsMobiles = data.map((e) => MobileModel.fromJson(e)).toList();
    notifyListeners();
    return Future.value();
  }

  Future<void> addMobile(MobileModel newMobile) async {
    print('ADD');
    NetworkHelper networkHelper = NetworkHelper("$_baseBack");
    await networkHelper.postData(newMobile.toJson());
    _itemsMobiles.add(newMobile);
    notifyListeners();
  }

  Future<void> updateMobile(MobileModel mobile) async {
    if (mobile == null || mobile.id == null) {
      return;
    }

    print('Update: $mobile.id');

    NetworkHelper networkHelper = NetworkHelper("$_baseBack/$mobile.id");
    await networkHelper.putData(mobile.toJson());
    final index = _itemsMobiles.indexWhere((prod) => prod.id == mobile.id);
    _itemsMobiles[index] = mobile;
    notifyListeners();
  }

  Future<void> deleteMobile(String id) async {
    NetworkHelper networkHelper = NetworkHelper("$_baseBack/$id");
    await networkHelper.deleteData();
    final index = _itemsMobiles.indexWhere((prod) => prod.id == id);

    if (index >= 0) {
      final mobile = _itemsMobiles[index];
      _itemsMobiles.remove(mobile);
      notifyListeners();
    }
  }
}
