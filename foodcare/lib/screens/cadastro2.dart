import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodcare/screens/login.dart';
import 'package:foodcare/screens/inicio.dart';
import 'package:foodcare/network/network.dart';
import 'package:foodcare/models/usuario_cadastro.dart';
import 'package:flutter/src/widgets/routes.dart';


class Cadastro2 extends StatefulWidget{

  
  Cadastro2();

  @override
  State<Cadastro2> createState() => _Cadastro2State();
}
 
class DropDown extends StatefulWidget {
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State <DropDown> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: criaDropDownButton(),
   );
  }
   criaDropDownButton() {
      
   }
}
enum Sexo { fem, masc }
var valueObj = ValueNotifier('');

const List<String> obj = <String>['Manter massa', 'Perder massa', 'Ganhar massa'];
class _Cadastro2State extends State<Cadastro2>{
  
  Sexo? _sexo = Sexo.fem;
  String dropdownValue = obj.first;
  final _network = Network(); 

  late TextEditingController _anoController;
  late TextEditingController _pesoController;
  late TextEditingController _alturaController;

  String buttonText = 'Save';
  int? id;

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text('Cadastro efetuado com sucesso!'),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ); 
      }
    );
  }
  @override
  void initState() {
    _anoController  = TextEditingController();
    _pesoController = TextEditingController();
    _alturaController = TextEditingController();
    super.initState();
  }
  void usuario() {
    UsuarioCadastro user;
    
    setState(() {
      
    });  
  }
  void _dropDownItemSelected(String novoItem) {
    setState(() { 
      //this._itemSelecionado = novoItem;
    });
  }
  @override
  Widget build(BuildContext context) {

     Map data = {};
     data = ModalRoute.of(context)!.settings.arguments as Map;
     String nome = data["nome"];
     String email = data["email"];
     String senha = data["senha"];
     int objetivo = 0;
    String sexo = "Feminino";
    UsuarioCadastro usuario_cadastro;
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
                    "Olá, $nome! Só mais alguns passos para efetuarmos o seu cadastro.",
                    style: TextStyle(   
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Container( //idade
                  padding: EdgeInsets.only(top:80),
                  child: TextFormField(
                    controller: _anoController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Data de Nascimento: (YYYY-MM-DD) ",
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
                    controller: _alturaController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Altura (cm): ",
                        hintStyle: TextStyle(color: Colors.black),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container( //sexo
                  padding: EdgeInsets.only(top:150),
                  child: Column(
                    children: <Widget>[
                      Text("Qual o seu sexo?", ),
                      ListTile(  
                        title: const Text('Feminino'),  
                        leading: Radio<Sexo>(  
                          value: Sexo.fem,
                          groupValue: _sexo,
                          onChanged: ( Sexo? value){  
                            setState(() {  
                               _sexo = value;  
                            });
                            if(value == Sexo.fem) {
                              sexo = "Feminino";
                              print(sexo);
                            }  
                          }, 
                          
                        ),  
                      ),  
                      ListTile(  
                        title: const Text('Masculino'),  
                        leading: Radio<Sexo>(  
                          value: Sexo.masc,
                          groupValue: _sexo,
                          onChanged: ( Sexo? value){  
                            setState(() {  
                               _sexo = value;  
                            });  
                            if(value == Sexo.masc) {
                              sexo = "Masculino";
                              print(sexo);
                            } 
                          },  
                        ),  
                      ),  
                    ],
                  ),
                ),
               
                SizedBox(
                      height: 10.0,
                    ),
                ValueListenableBuilder(
                      valueListenable:
                          valueObj,
                      builder: (BuildContext context, String value, _) {
                        return Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: DropdownButtonFormField<String>(
                                isExpanded: true,
                                decoration: InputDecoration(
                                  label: const Text(
                                    'Qual o seu objetivo?',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 240, 66, 61),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                        
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                        color: Color.fromARGB(255, 240, 66, 61),
                                        width: 2,
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                        color: Color.fromARGB(255, 240, 66, 61),
                                        width: 2,
                                      )),
                                ),
                                value: (value.isEmpty) ? null : value,
                                items: obj
                                    .map((op) => DropdownMenuItem(
                                          value: op,
                                          child: Text(op),
                                        ))
                                    .toList(),
                                onChanged: (escolha) {
                                  valueObj
                                      .value = escolha.toString();
                                }));
                      }), 
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
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          "/login",
                        );
                        usuario_cadastro = new UsuarioCadastro(nome: nome, email: email, senha: senha, data_nasc: _anoController.text, peso: int.parse(_pesoController.text), altura: int.parse(_alturaController.text),sexo: sexo, objetivos: objetivo);
                        _network.criaUser(usuarioCadastro: usuario_cadastro);
                        
                        _showDialog();
                      }
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