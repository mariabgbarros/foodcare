// ignore_for_file: unnecessary_new

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodcare/models/usuario_cadastro.dart';
import 'package:foodcare/screens/home.dart';
import 'package:foodcare/screens/perfil.dart';
import 'package:foodcare/screens/telagrafico2.dart';
import 'package:foodcare/models/usuario_login.dart';
import 'package:foodcare/network/network.dart';

class Login extends StatefulWidget {
  const Login({
    Key? key,
  }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // UsuarioLogin usuarioLogin = new UsuarioLogin(email: "", senha: "senha", id: 1);
  UsuarioCadastro user = new UsuarioCadastro(
      nome: "",
      email: "",
      senha: "",
      data_nasc: "",
      peso: 0,
      altura: 0,
      sexo: "",
      objetivos: 2);
  final _network = Network();

  late TextEditingController _emailController;
  late TextEditingController _senhaController;

  String buttonText = 'LOGIN';
  int? id;

  @override
  void initState() {
    _emailController = TextEditingController();
    _senhaController = TextEditingController();
    super.initState();
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('Senha ou email incorretos!'),
            content: new Text('Por favor, digite novamente.'),
            actions: <Widget>[
              FlatButton(
                child: new Text("Fechar"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 252, 240, 240),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 240, 66, 61),
          title: Text(
            "LOGIN",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Form(
                  //key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 100,
                      ),
                      SizedBox(
                          child: Image.asset('assets/images/logoLogin.png')),
                      Card(
                          child: Column(children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(40),
                          child: TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Email",
                              icon: Icon(Icons.email_outlined),
                              iconColor: Color.fromARGB(255, 240, 66, 61),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(40),
                          child: TextFormField(
                            controller: _senhaController,
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              icon: Icon(Icons.key_off_outlined),
                              labelText: "Senha",
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ])),
                      Container(
                        padding: EdgeInsets.all(40),
                        child: ElevatedButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 255, 98, 39),
                          ),
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          onPressed: () {
                            UsuarioCadastro user = new UsuarioCadastro(
                                nome: "",
                                email: _emailController.text,
                                senha: _senhaController.text,
                                data_nasc: "",
                                peso: 0,
                                altura: 0,
                                sexo: " ",
                                objetivos: 2);

                            UsuarioCadastro? usuarioConsultado;
                            _network
                                .getUsuario(usuario: user)
                                .then((resultado) {
                              if (resultado == null) {
                                _showDialog();
                              } else if (resultado.senha !=
                                  _senhaController.text) {
                                _showDialog();
                              } else {
                                Navigator.pushReplacementNamed(
                                    context, "/perfil",
                                    arguments: {"usuario": resultado});
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}
