import 'package:flutter/material.dart';
import 'package:hack_infor/models/usuario_previ_model.dart';
import 'package:hack_infor/provider/networking.dart';
import 'package:hack_infor/utils/constantes.dart';

class UsuarioPreviProvider with ChangeNotifier {
  final String _baseBack = '${Constantes.BASE_API_BACK}/usuarios';

  UsuariosPrevi _usuarioPrevi;

  Future<void> loadUsuario() async {
    NetworkHelper networkHelper = NetworkHelper("$_baseBack");
    var query = {'prv': 'PRV123'};
    //dynamic data = await networkHelper.getDataBy(query);
    //_usuarioPrevi = UsuariosPrevi.fromJson(data);
    _usuarioPrevi = UsuariosPrevi(
        id: '123',
        cargo: 'DIRETOR',
        diretoria: 'DISEG',
        gerencia: 'DISEG',
        nome: 'MARCIO',
        prv: 'PRV123');
    notifyListeners();
    return Future.value();
  }
}
