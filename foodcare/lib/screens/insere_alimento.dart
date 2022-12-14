import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodcare/models/alimento.dart';
import 'package:foodcare/models/usuario_cadastro.dart';
import 'package:foodcare/screens/home.dart';
import 'package:foodcare/screens/perfil.dart';
import 'package:foodcare/screens/telagrafico2.dart';
import 'package:foodcare/models/usuario_login.dart';
import 'package:foodcare/network/network.dart';
import 'package:foodcare/models/refeicoes.dart';

class InsereAlimento extends StatefulWidget {
  const InsereAlimento({
    Key? key,
  }) : super(key: key);

  @override
  State<InsereAlimento> createState() => _InsereAlimentoState();
}

class _InsereAlimentoState extends State<InsereAlimento> {
  final _network = Network();

  late TextEditingController _alimentoController;
  late TextEditingController _qtdAlimentoController;

  String buttonText = 'INSERIR REFEIÇÂO';
  int? id;

  @override
  void initState() {
    _alimentoController = TextEditingController();
    _qtdAlimentoController = TextEditingController();
    super.initState();
  }

  Widget build(BuildContext context) {
    Map data = {};

    data = ModalRoute.of(context)!.settings.arguments as Map;
    Refeicoes refeicaoContext = data["refeicaoContext"];
    UsuarioCadastro usuario_cadastro = data["usuario"];

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
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 80),
                        child: TextFormField(
                          controller: _alimentoController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Alimento",
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 50),
                        child: TextFormField(
                          controller: _qtdAlimentoController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Quantidade (g)",
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 50),
                        child: ElevatedButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 255, 98, 39),
                          ),
                          child: Text(
                            'INSERIR REFEIÇÂO',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          onPressed: () {
                            Alimento alimentoInserido = new Alimento(
                              id: refeicaoContext.id,
                              nome: _alimentoController.text,
                              qtd_g: int.parse(_qtdAlimentoController.text),
                            );
                            _network.criaAlimento(
                                alimento: alimentoInserido,
                                idRefeicao: refeicaoContext.id!);
                            Navigator.pushReplacementNamed(context, "/dieta",
                                arguments: {"usuario": usuario_cadastro});
                          },
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}
