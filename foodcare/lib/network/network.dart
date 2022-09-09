import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:foodcare/models/usuario_login.dart';

class Network {
  final _baseUrl = 'https://foodcares.herokuapp.com/';
Future<List<UsuarioLogin>?> get read async {
    final url = '${_baseUrl}cr/read';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
if (response.statusCode == 200) {
      return _usuariologinsFromJson(response.body);
    }
    return null;
  }
Future<void> write(
    UsuarioLogin usuariologin,
  ) async {
    final url = '${_baseUrl}cr/write';
    final uri = Uri.parse(url);
    await http.post(
      uri,
      body: usuariologin.toJson,
    );
  }
Future<bool> check(UsuarioLogin usuariologin) async {
    final url = '${_baseUrl}cr/check';
    final uri = Uri.parse(url);
    final response = await http.post(
      uri,
      body: usuariologin.toJson,
    );
    switch (response.statusCode) {
      case 200:
        return true;
      default:
        return false;
    }
  }
Future<void> update(
    UsuarioLogin usuariologin,
  ) async {
    final url = '${_baseUrl}ud/update';
    final uri = Uri.parse(url);
    await http.post(
      uri,
      body: usuariologin.toJson,
    );
  }
Future<void> delete(
    UsuarioLogin usuariologin,
  ) async {
    final url = '${_baseUrl}ud/delete';
    final uri = Uri.parse(url);
    await http.post(
      uri,
      body: {
        "id": usuariologin.id.toString(),
      },
    );
  }
List<UsuarioLogin> _usuariologinsFromJson(String str) {
    return List<UsuarioLogin>.from(
      json.decode(str).map(
            (x) => UsuarioLogin.fromJson(x),
          ),
    );
  }
}