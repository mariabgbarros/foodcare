import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodcare/screens/login.dart';
import 'package:foodcare/screens/inicio.dart';
import 'package:foodcare/network/network.dart';
import 'package:foodcare/models/usuario_cadastro.dart';

class Cadastro2 extends StatefulWidget{

  String nome, email, senha;

  Cadastro2(this.nome, this.email, this.senha);

  @override
  State<Cadastro2> createState() => _Cadastro2State();
}

class _Cadastro2State extends State<Cadastro2>{

  final _network = Network(); 

  late TextEditingController _idadeController;
  late TextEditingController _pesoController;
  late TextEditingController _alturaController;

  String buttonText = 'Save';
  int? id;

  @override
  void initState() {
    _idadeController  = TextEditingController();
    _pesoController = TextEditingController();
    _alturaController = TextEditingController();
    super.initState();
  }
  void AlertCadastro() {

  }
  @override
  Widget build(BuildContext context) {
    var usuario_cadastro;
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
                  padding: EdgeInsets.only(top:50), 
                  child: Text(
                    "dosso",
                    //"Olá ${usuario_cadastro.nome}! Só mais alguns passos para efetuarmos o seus cadastro.",
                    style: TextStyle(   
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Container( //idade
                  padding: EdgeInsets.only(top:80),
                  child: TextFormField(
                    controller: _idadeController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Idade: ",
                        hintStyle: TextStyle(color: Colors.black),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container( //peso
                  padding: EdgeInsets.only(top:80),
                  child: TextFormField(
                    controller: _pesoController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Peso (kg): ",
                        hintStyle: TextStyle(color: Colors.black),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container( //altura
                  padding: EdgeInsets.only(top:80),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Altura (cm): ",
                        hintStyle: TextStyle(color: Colors.black),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container( // objetivos
                  padding: EdgeInsets.only(top:80), 
                  child: DropdownButton(
                      value: 'Perder peso',
                      icon: const Icon(
                        Icons.arrow_downward,
                        color:  Color.fromARGB(255, 240, 66, 61)
                      ),
                      elevation: 16,
                      style: const TextStyle(
                      color:  Color.fromARGB(255, 240, 66, 61),
                      ),
                      underline: Container(
                        height: 2,
                      ),
                      onChanged: (String? newValue) {
                          
                      },
                      items: <String>['Perder peso', 'Ganhar peso', 'Manter peso']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                ),
                
                Container( //alergia
                    padding: EdgeInsets.only(top:80),
                    child: DropdownButton(
                      value: 'Sim',
                       icon: const Icon(
                        Icons.arrow_downward,
                        color:  Color.fromARGB(255, 240, 66, 61)
                      ),
                      elevation: 16,
                      style: const TextStyle(
                      color:  Color.fromARGB(255, 240, 66, 61),
                      ),
                      underline: Container(
                        height: 2,
                      ),
                      onChanged: (String? newValue) {
                          
                      },
                      items: <String>['Sim', 'Não']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
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
                        'CADASTRAR',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () => showDialog<String>(
                        context: context, 
                        builder: (BuildContext context) => AlertDialog(
                          content: const Text('Seu cadastro foi efetuado!'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                    ),
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