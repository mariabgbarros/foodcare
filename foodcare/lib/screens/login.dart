import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodcare/screens/home.dart';
import 'package:foodcare/screens/tela_piechart.dart';
import 'package:foodcare/screens/telagrafico2.dart';

class Login extends StatelessWidget{
  @override
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
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.black),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                   padding: EdgeInsets.only(top:50),
                  child: TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        labelText: "Senha",
                        labelStyle: TextStyle(color: Colors.black),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 50),
                  child:
                    TextButton(
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
                        Navigator.push(
                          context,
                          //MaterialPageRoute(builder: (context) => Home()),
                                                    MaterialPageRoute(builder: (context) => PieChartPage2()),

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