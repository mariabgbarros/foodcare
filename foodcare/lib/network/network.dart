import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http hide Response;
import 'package:foodcare/models/usuario_login.dart';
import 'package:foodcare/models/usuario_cadastro.dart';



class Network {

  final _baseUrl = 'https://foodcares.herokuapp.com';
  final Dio _dio = Dio();

  Future<UsuarioCadastro?> getUsuario({required UsuarioCadastro usuario}) async {
    UsuarioCadastro? usuarioConsultado;
    try {
      Response userData = await _dio.get(_baseUrl + '/usuarios/' + usuario.email);
      print('User Info: ${userData.data}');

      if (userData.data == null)
        return null;
      
      usuarioConsultado = UsuarioCadastro.fromJson(userData.data);

    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        print('error sending request');
        print(e.message);
      }
    }
    print(usuarioConsultado);
    return usuarioConsultado;
  }

Future<UsuarioCadastro?> criaUser({required UsuarioCadastro usuarioCadastro}) async {
  UsuarioCadastro? retrievedUser;

  try {
     print('User created: ${usuarioCadastro.toJson}');
    Response response = await _dio.post(
      _baseUrl + '/usuarios',
      data: usuarioCadastro.toJson,
    );

    retrievedUser = UsuarioCadastro.fromJson(response.data);
  } catch (e) {
      print('Error creating user: $e');
  }
  return retrievedUser;
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

List<UsuarioLogin> _usuariologinsFromJson(String str) {
    return List<UsuarioLogin>.from(
      json.decode(str).map(
            (x) => UsuarioLogin.fromJson(x),
          ),
    );
  }
}