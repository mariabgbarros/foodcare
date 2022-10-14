import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodcare/screens/cadastro2.dart';
import 'package:foodcare/network/network.dart';
import 'package:foodcare/models/usuario_cadastro.dart';
import 'package:flutter/src/material/input_border.dart';

class Cadastro1 extends StatefulWidget{
  const Cadastro1 ({
    Key? key,
  }) : super(key:key);

  @override
  State<Cadastro1> createState() => _Cadastro1State();
}

class _Cadastro1State extends State<Cadastro1> {

  
  final _network = Network(); 

  late TextEditingController _nomeController;
  late TextEditingController _emailController;
  late TextEditingController _senhaController;

  String buttonText = 'Save';
  int? id;

  void Proximo() {
    String nome, email, senha;

    setState(() {
      nome = _nomeController.text;
      email = _emailController.text;
      senha = _senhaController.text;

      Navigator.push(context, MaterialPageRoute(builder: (context) => Cadastro2(nome, email, senha)));
    });
  }

  @override
  void initState() {
    _nomeController  = TextEditingController();
    _emailController = TextEditingController();
    _senhaController = TextEditingController();
    super.initState();
  }
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
                    controller: _nomeController,
                    keyboardType: TextInputType.name,
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Nome: ",
                        hintStyle: TextStyle(color: Colors.black),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
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
                   padding: EdgeInsets.only(top:80),
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
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 255, 98, 39),
                      ),
                      child: Text(
                        'PRÓXIMO',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () {
                         Proximo();
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
  
