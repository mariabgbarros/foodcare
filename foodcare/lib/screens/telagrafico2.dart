import 'package:flutter/material.dart';
import '/widgets/pie_chart_sample.dart';
import '/widgets/bar_chart_sample.dart';
import 'package:foodcare/nav/nav_bar.dart';
import 'package:foodcare/models/usuario_cadastro.dart';

class PieChartPage2 extends StatelessWidget {
  final Color barColor = Colors.white;
  final Color barBackgroundColor = const Color(0xff72d8bf);
  final double width = 22;

  const PieChartPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map data = {};

    data = ModalRoute.of(context)!.settings.arguments as Map;

    UsuarioCadastro user = data["usuario"];
    print(user);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 240, 240),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 240, 66, 61),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [ Color.fromARGB(255, 240, 66, 61), Color.fromARGB(255, 240, 66, 61)]
              )
            ),
          child: Container(
            width: double.infinity, 
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: ListView(
                children: const <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.0),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  PieChartSample1(),
                  SizedBox(
                    height: 8,
                  ),
                  BarChartSample(),
                ],
              ),
            ),
          ),
        )
      ),
      bottomNavigationBar: CustomNavBar(paginaAberta:0)

    );
    
    
  }
}