import 'package:flutter/foundation.dart';
import 'package:foodcare/screens/cadastro.dart';
import 'package:foodcare/screens/login.dart';
import 'package:foodcare/nav/nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodcare/models/usuario_cadastro.dart';
import 'package:foodcare/network/network.dart';

class PerfilApp extends StatelessWidget {
  /*const PerfilApp({
    Key? key,
    required this.usuario_cadastro,
    required this.delete,
    required this.update,
  }) : super(key: key);

  final VoidCallback delete;
  final VoidCallback update;
  final UsuarioCadastro usuario_cadastro; */
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
                    "Ligia",
                      /*"Peso: ${usuario_cadastro.peso.toString()}" 
                       "Idade: ${usuario_cadastro.anoNasc} " 
                       "Idade: ${usuario_cadastro.anoNasc}"
                       "Altura: ${usuario_cadastro.altura.toString()}"
                       "Objetivo: ${usuario_cadastro.objetivos}" ,
                       //"IMC: ${imc}", */
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