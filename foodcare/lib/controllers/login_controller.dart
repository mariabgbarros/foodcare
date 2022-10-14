/*import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:foodcare/models/usuario_login.dart';


class LoginController {
  late UsuarioLogin userLogin;
  late TextEditingController email;
  late TextEditingController senha;

LoginController({required this.email, required this.senha});

  void verificarLogin(BuildContext context) async {
    String textEmail = email.text;
    String textSenha = senha.text;

    if (textEmail == '') {
      ComponentsUtils.Mensagem(true, 'Usúario inexiste!', '', context);
      return;
    }

    try {
      var response = await http
          .get(Uri.parse('http://localhost:3000/paciente/$textEmail'));
      if (response.statusCode == 200) {
        userLogin = UsuarioLogin.fromJson(response.body);
        if (userLogin.email == textEmail || userLogin.cns == textEmail) {
          if (userLogin.senha == textSenha) {
            Navigator.of(context).pushReplacementNamed('/home', arguments: userLogin);
          } else {
            ComponentsUtils.Mensagem(true, 'Senha inválida!', '', context);
            return;
          }
        }
      } else {
        ComponentsUtils.Mensagem(true, 'Usúario inexiste!', '', context);
        return;
      }
    } catch (e) {
      //print(e.toString());
    }
  }

  void verificarCad6(BuildContext context) async {
    try {
      var response = await http.post(
          Uri.parse('http://localhost:3000/paciente'),
          body: userLogin.toMap());

      if (response.statusCode == 200) {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const FormCad7View()));
      }
    } catch (e) {
      print(e);
    }
  }
}



import 'package:flutter/material.dart';
import 'package:flutter_aula1/services/auth_service.dart';
import 'package:get/get.dart';

class AutenticacaoController extends GetxController {
  final email = TextEditingController();
  final senha = TextEditingController();
  final formKey = GlobalKey<FormState>();

  var titulo = 'Bem vindo!'.obs;
  var botaoPrincipal = 'Entrar'.obs;
  var appBarButton = 'Cadastre-se'.obs;
  var isLogin = true.obs;
  var isLoading = false.obs;

  @override
  onInit() {
    super.onInit();
    ever(isLogin, (visible) {
      titulo.value = visible ? 'Bem vindo' : 'Crie sua conta';
      botaoPrincipal.value = visible ? 'Entrar' : 'Registre-se';
      appBarButton.value = visible ? 'Cadastre-se' : 'Login';
      formKey.currentState.reset();
    });
  }

  login() async {
    isLoading.value = true;
    await AuthService.to.login(email.text, senha.text);
    isLoading.value = false;
  }

  registrar() async {
    isLoading.value = true;
    await AuthService.to.createUser(email.text, senha.text);
    isLoading.value = false;
  }

  toogleRegistrar() {
    isLogin.value = !isLogin.value;
  }
}

*/

