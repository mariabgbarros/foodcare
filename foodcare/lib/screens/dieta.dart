import 'package:flutter/foundation.dart';
import 'package:foodcare/screens/cadastro.dart';
import 'package:foodcare/screens/login.dart';
import 'package:flutter/material.dart';

class Dieta extends StatelessWidget{
  @override
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
            Container(
              alignment: Alignment.topCenter,
              child:  Image.asset('assets/images/logoinicio.png'),
            ),
            Container( 
              padding: EdgeInsets.all(20.0),
              child:
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 98, 39),
                  ),
                  child: Text(
                    'ENTRAR',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                ),
            ),
            
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 255, 98, 39),
              ),
              child: Text(
                'FAZER CADASTRO',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              onPressed: () {
                Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Cadastro1()),
                    );
              },
            ),
          ],
        )
      )),           
    );
  }
}