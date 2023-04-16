import 'package:web/model/Produto.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class ProdutoWSClient {

  Future<List<Produto>> getAll() async {
    var url = Uri.http("localhost:3000", '/produtos');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      List<Produto> result =
      (jsonResponse as List).map((i) => Produto.fromJson(i)).toList();
      return result;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return [];
  }

  Future<bool> alterar(Produto produto) async {
    print(produto.toJson());
    var url = Uri.http("localhost:3000",
      '/produtos/${produto.id}' );
    final headers = {"Content-type": "application/json"};
    String json = convert.jsonEncode(produto.toJson());
    var response = await http.put(url, headers: headers, body: json);
    if (response.statusCode == 200) {
      //var jsonResponse = convert.jsonDecode(response.body);
      return true;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return false;
  }
}