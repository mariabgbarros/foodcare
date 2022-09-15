/*import 'package:flutter/foundation.dart';
import 'package:foodcare/screens/cadastro.dart';
import 'package:foodcare/screens/login.dart';
import 'package:foodcare/nav/nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodcare/models/usuario_cadastro.dart';
import 'package:foodcare/network/network.dart';


class PersonCard extends StatelessWidget {
  const PersonCard({
    Key? key,
    required this.usuario_cadastro,
    required this.delete,
    required this.update,
  }) : super(key: key);

  final VoidCallback delete;
  final VoidCallback update;
  final UsuarioCadastro usuario_cadastro;
  //final int idade = DateTime.now() - usuario_cadastro.anoNasc;
  //final int imc = usuario_cadastro.peso / (usuario_cadastro.altura * usuario_cadastro.altura);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 240, 240),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 240, 66, 61),
      ),
      body: Center(
        child: Column(
          children: <Widget> [
          Card (
            margin: const EdgeInsets.all(8),
            color: Colors.white70,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('${usuario_cadastro.nome}'),
                        Text('Peso: ${usuario_cadastro.peso.toString()}'),
                        Text('Idade: ${usuario_cadastro.anoNasc}'),
                        Text('Altura: ${usuario_cadastro.altura.toString()}'),
                        Text('Objetivo: ${usuario_cadastro.objetivos}'),
                        //Text('IMC: ${imc}'),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      IconButton(
                        constraints: const BoxConstraints(),
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          update();
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          CupertinoIcons.arrow_clockwise_circle,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      IconButton(
                        constraints: const BoxConstraints(),
                        padding: EdgeInsets.zero,
                        onPressed: () async {
                          //await Network()
                                    //.delete(usuario_cadastro)
                                    //.whenComplete(usuario_cadastro);
                        },
                        icon: const Icon(
                          CupertinoIcons.delete,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          )] 
        ),
      ),
    );
  }
} */

import 'package:flutter/foundation.dart';
import 'package:foodcare/screens/cadastro.dart';
import 'package:foodcare/screens/login.dart';
import 'package:foodcare/nav/nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodcare/models/usuario_cadastro.dart';
import 'package:foodcare/network/network.dart';

class PerfilApp extends StatelessWidget {
  const PerfilApp({
    Key? key,
    required this.usuario_cadastro,
    required this.delete,
    required this.update,
  }) : super(key: key);

  final VoidCallback delete;
  final VoidCallback update;
  final UsuarioCadastro usuario_cadastro;
  //final int idade = DateTime.now() - usuario_cadastro.anoNasc;
  //final int imc = usuario_cadastro.peso / (usuario_cadastro.altura * usuario_cadastro.altura);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [ Color.fromARGB(255, 240, 66, 61), Color.fromARGB(255, 240, 66, 61)]
              )
            ),
            child: Container(
              width: double.infinity,
              height: 350.0,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg",
                      ),
                      radius: 50.0,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Perfil",//"${usuario_cadastro.nome}",
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                      ),
                    ),
                    
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            )
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      "Peso: ${usuario_cadastro.peso.toString()}" 
                       "Idade: ${usuario_cadastro.anoNasc} " 
                       "Idade: ${usuario_cadastro.anoNasc}"
                       "Altura: ${usuario_cadastro.altura.toString()}"
                       "Objetivo: ${usuario_cadastro.objetivos}" ,
                       //"IMC: ${imc}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28.0
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}