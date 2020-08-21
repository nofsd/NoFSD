import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final Map<String, String> headers = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };

  NetworkHelper(this.url);
  String erro = 'Erro no processamento';

  final String url;

  Future getData() async {
    http.Response response = await http.get(url);
    return _trataResposta(response);
  }

  Future<String> postData(data) async {
    http.Response response =
        await http.post(url, headers: headers, body: jsonEncode(data));
    if (response.statusCode == 201) {
      return 'Criado com sucesso';
    }
    return null;
  }

  Future<String> putData(data) async {
    http.Response response =
        await http.put(url, headers: headers, body: jsonEncode(data));
    if (response.statusCode == 200) {
      return 'Atualizado com sucesso';
    }
    return null;
  }

  Future<String> deleteData() async {
    http.Response response = await http.delete(url, headers: headers);
    if (response.statusCode == 200) {
      return 'Excluido com sucesso';
    }
    return null;
  }

  _trataResposta(response) {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return jsonDecode('{erro:$erro}');
    }
  }
}
