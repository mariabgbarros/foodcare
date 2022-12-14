import 'package:flutter/material.dart';
import '/widgets/pie_chart_sample.dart';
import '/widgets/bar_chart_sample.dart';
import 'package:foodcare/nav/nav_bar.dart';
import 'package:foodcare/models/usuario_cadastro.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:foodcare/widgets/indicators_widget.dart';
import 'package:foodcare/models/usuario_cadastro.dart';
import 'package:foodcare/models/quantidades.dart';
import 'package:foodcare/network/network.dart';

class PieChartPage2 extends StatefulWidget {
  const PieChartPage2({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PieChartPage2State();
}

class PieChartPage2State extends State {
  int touchedIndex = -1;

  UsuarioCadastro usuario_cadastro = new UsuarioCadastro(
      nome: "",
      email: "",
      senha: "",
      data_nasc: "",
      peso: 0,
      altura: 0,
      sexo: "",
      objetivos: 2);
  int valorCaloriaConsumida = 0;
  int valorCaloriaNecessaria = 0;
  int valorProteinaConsumida = 0;
  int valorLipidioConsumido = 0;
  int valorCarbConsumido = 0;
  int valorProteinaNecessaria = 0;
  int valorLipidioNecessario = 0;
  int valorCarbNecessario = 0;

  @override
  Widget build(BuildContext context) {
    final _network = Network();

    Quantidades qtdConsumida =
        new Quantidades(qtd_cal: 0, qtd_prot: 0, qtd_lip: 0, qtd_carb: 0);
    Map data = {};

    data = ModalRoute.of(context)!.settings.arguments as Map;

    usuario_cadastro = data["usuario"];

    _network
        .getQtdConsumida(quantidades: qtdConsumida, id: usuario_cadastro.id)
        .then((resultado) {
      print(usuario_cadastro.id);

      setState(() {
        if (resultado == null) {
          valorCaloriaConsumida = 0;
        } else {
          valorCaloriaConsumida = resultado.qtd_cal;
          valorProteinaConsumida = resultado.qtd_prot;
          valorLipidioConsumido = resultado.qtd_lip;
          valorCarbConsumido = resultado.qtd_carb;
        }
      });
    });
    _network
        .getQtdNecessaria(quantidades: qtdConsumida, id: usuario_cadastro.id)
        .then((resultado) {
      print(usuario_cadastro.id);

      setState(() {
        if (resultado == null) {
          valorCaloriaConsumida = 0;
        } else {
          valorCaloriaNecessaria = resultado.qtd_cal;
          valorProteinaNecessaria = resultado.qtd_prot;
          valorLipidioNecessario = resultado.qtd_lip;
          valorCarbNecessario = resultado.qtd_carb;
        }
      });
    });
    print(usuario_cadastro);
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: Color.fromARGB(255, 240, 66, 61),
                bottom: TabBar(tabs: [
                  Tab(icon: Icon(Icons.pie_chart_outline_outlined)),
                  Tab(icon: Icon(Icons.bar_chart_outlined)),
                ])),
            body: TabBarView(
              children: [
                Center(
                    child: AspectRatio(
                  aspectRatio: 1.3,
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Indicator(
                              color: Color.fromARGB(255, 152, 20, 20),
                              text: 'One',
                              isSquare: false,
                              size: touchedIndex == 0 ? 18 : 16,
                              textColor: touchedIndex == 0
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                            Indicator(
                              color: Color.fromARGB(255, 202, 65, 65),
                              text: 'Two',
                              isSquare: false,
                              size: touchedIndex == 1 ? 18 : 16,
                              textColor: touchedIndex == 1
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                            Indicator(
                              color: const Color.fromARGB(255, 210, 116, 72),
                              text: 'Three',
                              isSquare: false,
                              size: touchedIndex == 2 ? 18 : 16,
                              textColor: touchedIndex == 2
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: PieChart(
                              PieChartData(
                                  pieTouchData: PieTouchData(touchCallback:
                                      (FlTouchEvent event, pieTouchResponse) {
                                    setState(() {
                                      if (!event.isInterestedForInteractions ||
                                          pieTouchResponse == null ||
                                          pieTouchResponse.touchedSection ==
                                              null) {
                                        touchedIndex = -1;
                                        return;
                                      }
                                      touchedIndex = pieTouchResponse
                                          .touchedSection!.touchedSectionIndex;
                                    });
                                  }),
                                  startDegreeOffset: 180,
                                  borderData: FlBorderData(
                                    show: false,
                                  ),
                                  sectionsSpace: 1,
                                  centerSpaceRadius: 0,
                                  sections: showingSections()),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
                Center(
                    child: AspectRatio(
                  aspectRatio: 1.7,
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: BarChart(
                      BarChartData(
                        barTouchData: barTouchData,
                        titlesData: titlesData,
                        borderData: borderData,
                        barGroups: barGroups,
                        gridData: FlGridData(show: false),
                        alignment: BarChartAlignment.spaceAround,
                        maxY: 1,
                      ),
                    ),
                  ),
                )),
                IconButton(
                    onPressed: () {
                      onPressed:
                      () {
                        Navigator.pushReplacementNamed(context, "/perfil",
                            arguments: {"usuario": usuario_cadastro});
                      };
                    },
                    icon: Icon(Icons.person)),
                IconButton(
                    //dieta
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, "/dieta",
                          arguments: {"usuario": usuario_cadastro});
                    },
                    icon: Icon(Icons.apple_outlined)),
                IconButton(
                    //telagrafico
                    onPressed: () {
                      onPressed:
                      () {
                        Navigator.pushReplacementNamed(context, "/grafico",
                            arguments: {"usuario": usuario_cadastro});
                      };
                    },
                    icon: Icon(Icons.home))
              ],
            )));
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
        text = 'Prote??na';
        break;
      case 1:
        text = 'Carboidrato';
        break;
      case 2:
        text = 'Lip??dio';
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
          x: 0, //proteina
          barRods: [
            BarChartRodData(
              width: 35,
              borderRadius: BorderRadius.all(Radius.circular((2))),
              toY: valorProteinaConsumida.toDouble() /
                  valorProteinaNecessaria.toDouble(),
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
              toY: valorCarbConsumido.toDouble() /
                  valorCarbNecessario.toDouble(),
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
              toY: valorLipidioConsumido.toDouble() /
                  valorLipidioNecessario.toDouble(),
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
      ];
  List<PieChartSectionData> showingSections() {
    return List.generate(
      2,
      (i) {
        final isTouched = i == touchedIndex;
        final opacity = isTouched ? 1.0 : 0.6;

        const color0 = Color.fromARGB(255, 152, 20, 20);
        const color1 = Color(0xFFFFFFFF);

        switch (i) {
          case 0:
            return PieChartSectionData(
              color: color0.withOpacity(opacity),
              value: valorCaloriaConsumida.toDouble(),
              title: '',
              radius: 80,
              titleStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff044d7c)),
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? BorderSide(color: const Color(0xffffffff), width: 6)
                  : BorderSide(color: color0.withOpacity(0)),
            );
          case 1:
            return PieChartSectionData(
              color: color1.withOpacity(opacity),
              value:
                  (valorCaloriaNecessaria - valorCaloriaConsumida).toDouble(),
              title: '',
              radius: 80,
              titleStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff90672d)),
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? BorderSide(color: const Color(0xffffffff), width: 6)
                  : BorderSide(color: color1.withOpacity(0)),
            );
          default:
            throw Error();
        }
      },
    );
  }
}
