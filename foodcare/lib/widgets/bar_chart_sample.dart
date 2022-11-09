import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:foodcare/models/usuario_cadastro.dart';

class _BarChart extends StatelessWidget {
  const _BarChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
   {
     Map data = {};

    data = ModalRoute.of(context)!.settings.arguments as Map;

    UsuarioCadastro user = data["usuario"];
    print(user);

    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        gridData: FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: 20,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: const EdgeInsets.all(0),
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Proteína';
        break;
      case 1:
        text = 'Carboidrato';
        break;
      case 2:
        text = 'Gordura';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4.0,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  final _barsGradient = const LinearGradient(
    colors: [
      Color.fromARGB(255, 152, 20, 20),
      Color.fromARGB(255, 210, 116, 72),
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
              width: 35,
              borderRadius: BorderRadius.all(Radius.circular((2))),
              toY: 8,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
              width: 35,
              borderRadius: BorderRadius.all(Radius.circular((2))),
              toY: 10,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
              width: 35,
              borderRadius: BorderRadius.all(Radius.circular((2))),
              toY: 14,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
       
      ];
}

class BarChartSample extends StatefulWidget {
  const BarChartSample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BarChartSampleState();
}

class BarChartSampleState extends State<BarChartSample> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        color: Color.fromARGB(255, 255, 255, 255),
        child: const _BarChart(),
      ),
    );
  }
}