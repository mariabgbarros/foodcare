import 'package:foodcare/nav/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:foodcare/screens/telagrafico2.dart';
import '/widgets/pie_chart_sample.dart';
import '/widgets/bar_chart_sample.dart';

class Home extends StatelessWidget{
  int touchedIndex = -1;

  final Color barColor = Colors.white;
  final Color barBackgroundColor = const Color(0xff72d8bf);
  final double width = 22;

  //const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 240, 240),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 240, 66, 61),
      ),
      body: Center(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[ 
            //color: const Color(0xffeceaeb),
            /*child: */Padding(
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
          
          ],
        )
      ),
      bottomNavigationBar: CustomNavBar(paginaAberta:0),
    );

     //PieChartPage2();
  }
}
