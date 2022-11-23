import 'package:flutter/foundation.dart';
import 'package:foodcare/screens/cadastro.dart';
import 'package:foodcare/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:foodcare/nav/nav_bar.dart';
import 'package:foodcare/models/refeicoes.dart';
import 'package:foodcare/models/usuario_cadastro.dart';
import 'package:foodcare/network/network.dart';

class Dieta extends StatefulWidget{
  
  Dieta();

  @override
  State<Dieta> createState() => _DietaState();

}

class _DietaState extends State<Dieta> {
Widget build(BuildContext context) {
    
     final _network = Network(); 
     
     Map data = {};

    data = ModalRoute.of(context)!.settings.arguments as Map;
    UsuarioCadastro usuario_cadastro = data["usuario"];
    Refeicoes refeicaoAtual = new Refeicoes(alimentos: "", id: usuario_cadastro.id);
    String alimentos = " ";

      _network.getRefeicao(refeicao: refeicaoAtual, id: usuario_cadastro.id).then ( (resultado) {
        print(usuario_cadastro.id);
        if (resultado == null) {
          alimentos = "Você ainda não registrou nenhuma refeição :(";
        } else  {
          alimentos = resultado.alimentos;
        }
      });
    
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
                  
                  child: Center(child: Text( "${alimentos}"

                  ))
                ),
              )
            ),
            SizedBox(height: 400,),
            Container(
              child: ElevatedButton(
                
                onPressed: () {
                        
                },
                child: Text(
                          'Inserir alimento',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
               style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 98, 39),
                  ),
              ),
            )
          ],
        )
      ))       
    );
  }

}
  