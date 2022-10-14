import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:foodcare/models/usuario_login.dart';
import 'package:foodcare/models/usuario_cadastro.dart';
import 'package:http/http.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:requests/requests.dart';


class CustomInterceptors extends InterceptorsWrapper {
  @override 
  final IUserService userService = new IUserService();
  var options = BaseOptions(baseUrl: '', connectTimeout: 5000,);
  Dio dio = new Dio(options);

  Future <onRequest>(RequestOptions options) async {
    var userService = Modular.get<IUserService>();
    var user = await userService.getCurrentUser();

    if(user?.token != null && user.token.isNotEmpty) {
      var headerAuth = 'Bearer $user.token';
      options.headers['Authorization'] = headerAuth;
    }
    if (kDebugMode) {
      debugPrint(json.encode("BaseURL: ${options.baseUrl}"));
      debugPrint(json.encode("Endpoint: ${options.path}"));
      if (options.headers['Authorization' != null]) {
        debugPrint("Authorization: ${options.headers}");
      }
      if (options.data != null) {
        debugPrint("Payload ...");
      }
    }
    return super.onRequest(options);
  }
} 

class CacheInterceptors extends InterceptorsWrapper {
  @override 
  Future onResponse(http.Response response) async {
      print('Response [${response.statusCode}] => PATH: ${response.request.path}');
      if (response.request.extra.containsKey('') &&
          response.request.extra['refresh']) {
          var cache = await _getCache(response.request.uri);

          if (cache == null || cache.expired) {
            save(response.request.uri.toString(), response.data);
          }
      }

  }
}