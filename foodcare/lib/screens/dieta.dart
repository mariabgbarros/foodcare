import 'package:flutter/foundation.dart';
import 'package:foodcare/screens/cadastro.dart';
import 'package:foodcare/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:foodcare/nav/nav_bar.dart';
import 'package:foodcare/models/refeicoes.dart';
import 'package:foodcare/network/network.dart';

class Dieta extends StatelessWidget{
  @override
  const Dieta({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    
    
    Refeicoes refeicao = new Refeicoes(alimentos: "arroz , 100 g", id: 5);
    
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 240, 240),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 240, 66, 61),
      ),
      body: SingleChildScrollView ( child:Center(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Card(
                child: SizedBox(
                  width: 400,
                  height: 50,
                  child: Center(child: Text("${refeicao.alimentos}"))
                ),
              )
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                       // Proximo();
                },
                child: Text('Inserir alimento'),

              ),
            )
          ],
        )
      )),bottomNavigationBar: CustomNavBar(paginaAberta:3),           
    );
  }
}