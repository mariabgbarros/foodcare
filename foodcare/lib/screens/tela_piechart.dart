import 'package:fl_chart/fl_chart.dart';
import 'package:foodcare/widgets/indicators_widget.dart';
import 'package:foodcare/widgets/pie_charts_section.dart';
import 'package:flutter/material.dart';

class PieChartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PieChartPageState();
}

class PieChartPageState extends State {
  int touchedIndex = 0;

  @override
  Widget build(BuildContext context) => 
  
  Scaffold( body: SizedBox(height:  MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width, child: SingleChildScrollView(child: Card(
        
         child: Column(
          children: <Widget>[
            Expanded(
              child: SizedBox(
                height: 200.0, child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(show: false),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: getSections(touchedIndex),
                ),
              ),
            )
            /*Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: IndicatorsWidget(),
                ),
              ],
            ), */
            )],
            
        ),
      
  ))));
}