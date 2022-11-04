import 'package:flutter/foundation.dart';
import 'package:foodcare/screens/cadastro.dart';
import 'package:foodcare/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:foodcare/nav/nav_bar.dart';

class Dieta extends StatelessWidget{
  @override
  const Dieta({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 240, 240),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 240, 66, 61),
      ),
      body: SingleChildScrollView ( child:Center(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
          ],
        )
      )),bottomNavigationBar: CustomNavBar(paginaAberta:3),           
    );
  }
}