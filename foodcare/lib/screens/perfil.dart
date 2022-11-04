// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:foodcare/models/usuario_cadastro.dart';
import 'package:foodcare/nav/nav_bar.dart';
import 'package:foodcare/network/network.dart';
import 'package:foodcare/screens/cadastro.dart';
import 'package:foodcare/screens/login.dart';

class PerfilApp extends StatelessWidget {
   PerfilApp({
    Key? key,
    required this.usuario_cadastro,
  }) : super(key: key);

  final UsuarioCadastro usuario_cadastro; 
  //final int idade = DateTime.now() - usuario_cadastro.data_nasc;
  //final double imc = usuario_cadastro.peso / (usuario_cadastro.altura * usuario_cadastro.altura); 

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
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "${usuario_cadastro.nome}",
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
                       "Idade: ${usuario_cadastro.data_nasc} " 
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
