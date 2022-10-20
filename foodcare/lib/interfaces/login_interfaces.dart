import 'package:foodcare/models/usuario_login.dart';
import 'package:dio/dio.dart';

abstract class ILogin {
  /*Future<UsuarioLogin> login(String email, String password) async {
    final api = 'https://fakestoreapi.com/auth/login';
    final data = {"email": email, "senha": password};

    final dio = Dio();
    Response response;

    response = await dio.post(api, data: data);
    if (response.statusCode == 200) {
      final body = response.data;
      return UsuarioLogin( email: email, senha: password);
    } else {
      return();
    }
  } */
}