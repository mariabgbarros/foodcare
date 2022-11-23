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

      Navigator.pushReplacementNamed(
        context, 
        "/cadastro2",
        arguments: {"nome": _nomeController.value.text, "email": _emailController.value.text, "senha": _senhaController.value.text} );
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
        title: Text("CADASTRO", style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            //key: _formKey,
            child: Column(
              children: <Widget> [
                SizedBox(
                  height: 100,
                ),
                SizedBox(child: Image.asset('assets/images/logoLogin.png')),
                Card(
                   child: Column(
                   children: <Widget> [
                      Container(
                  padding: EdgeInsets.all(40),
                  child: TextFormField(
                    controller: _nomeController,
                    keyboardType: TextInputType.name,
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Nome",
                        icon: Icon(Icons.person)
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(40),
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                       labelText: "Email",
                       icon: Icon(Icons.email_outlined)
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                   padding: EdgeInsets.all(40),
                  child: TextFormField(
                    controller: _senhaController,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Senha",
                        icon: Icon(Icons.password_outlined)
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                   ]
                  )
                ),
               
                Container(
                  padding: EdgeInsets.all(40),
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
  
