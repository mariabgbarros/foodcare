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
   PerfilApp({Key? key,}) : super(key: key);
  
  //final double imc = usuario_cadastro.peso / (usuario_cadastro.altura * usuario_cadastro.altura); 
  @override
  Widget build(BuildContext context) {
    Map data = {};

    data = ModalRoute.of(context)!.settings.arguments as Map;
    UsuarioCadastro usuario_cadastro = data["usuario"];
    DateTime atual = DateTime.now();
    DateTime nasc = DateTime.parse(usuario_cadastro.data_nasc);
    int idade = atual.year  -  nasc.year;
    if (atual.month < nasc.month) {
      idade--;
    } else if (atual.month == nasc.month) {
      if(atual.day < nasc.day) {
        idade--;
      }
    }
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
              height: 300.0,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Perfil"),
                    Container(
                      width: double.infinity,
                      height: 100,
                      alignment: Alignment.topCenter,
                      child:  Image.asset('assets/images/perfil.jpg'),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "${usuario_cadastro.nome}",
                      style: TextStyle(
                        
                        fontSize: 40.0,
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                
                children: <Widget>[
                  Card(
                    child:SizedBox(
                      width: 400,
                      height: 50,
                      child: Center(child: Text("Peso: ${usuario_cadastro.peso.toString()}kg"))
                    ),
                  ), 
                  Card(
                    child:SizedBox(
                      width: 400,
                      height: 50,
                      child: Center(child:Text("Idade: ${idade} anos"))
                    ),
                  ),
                  Card(
                    child:SizedBox(
                      width: 400,
                      height: 50,
                      child: Center(child:Text("Altura: ${usuario_cadastro.altura.toString()}cm"))
                    ),
                  ),
                  Card(
                    child:SizedBox(
                      width: 400,
                      height: 50,
                      child: Center(child: Text("Objetivo: ${usuario_cadastro.objetivos}"))
                    ),
                  ),  //"IMC: ${imc}",  
                ]
              )
              ),
            ),
        ],
      ),
    );
  }
}
