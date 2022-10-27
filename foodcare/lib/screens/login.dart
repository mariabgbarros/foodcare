import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodcare/models/usuario_cadastro.dart';
import 'package:foodcare/screens/home.dart';
import 'package:foodcare/screens/perfil.dart';
import 'package:foodcare/screens/telagrafico2.dart';
import 'package:foodcare/models/usuario_login.dart';
import 'package:foodcare/network/network.dart';

class Login extends StatefulWidget{
  const Login({
    Key? key,
  }) : super(key:key);
  
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  UsuarioLogin usuarioLogin = new UsuarioLogin(email: "", senha: "senha", id: 1);
  //UsuarioCadastro user = new UsuarioCadastro(nome: "", email: "", senha: senha, anoNasc: anoNasc, peso: peso, altura: altura, alergias: alergias, objetivos: objetivos, id: id) ;
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

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 240, 240),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 240, 66, 61),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            //key: _formKey,
            child: Column(
              children: <Widget> [
                Container(
                  padding: EdgeInsets.only(top:80),
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.black),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                   padding: EdgeInsets.only(top:50),
                  child: TextFormField(
                    controller: _senhaController,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Senha",
                        hintStyle: TextStyle(color: Colors.black),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 50),
                  child:
                    ElevatedButton(
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
                       //_network.getUsuario(id: );
                       Navigator.pushReplacementNamed(
                         context,
                         "/grafico"
                       );
                      },
                    ),
                ),
              ],
            ),
          )
        )
      )

    );

  }

}