import 'package:flutter/material.dart';
import '/widgets/pie_chart_sample.dart';


class PieChartPage2 extends StatelessWidget {
  final Color barColor = Colors.white;
  final Color barBackgroundColor = const Color(0xff72d8bf);
  final double width = 22;

  const PieChartPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffeceaeb),
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
            
          ],
        ),
      ),
    );
  }
}