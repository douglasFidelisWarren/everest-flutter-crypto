import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../portfolio/repositories/coin_repository.dart';
import '../../shared/styles.dart';

class LineChartCoin extends StatefulWidget {
  const LineChartCoin({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LineChartCoinState();
}

class LineChartCoinState extends State<LineChartCoin> {
  late bool isShowingMainData;
  CoinRepository repo = CoinRepository();
  String dias = "1";

  @override
  void initState() {
    super.initState();
    isShowingMainData = false;
    //getSpots(1);
  }

  Future<List<FlSpot>> getSpots(int range) async {
    List<FlSpot> spots = await repo.getHistoricoMoeda(range);
    return spots;
  }

  @override
  Widget build(BuildContext context) {
    Future<List<FlSpot>> spots = getSpots(1);
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0, left: 6.0),
                  child: FutureBuilder(
                    initialData: const [
                      FlSpot(0, 100000),
                    ],
                    future: spots,
                    builder: (context, AsyncSnapshot snapshot) {
                      return Visibility(
                        visible: snapshot.hasData,
                        replacement: CircularProgressIndicator(),
                        child: LineChart(
                          LineChartData(
                            lineTouchData: LineTouchData(
                              handleBuiltInTouches: true,
                              touchTooltipData: LineTouchTooltipData(
                                tooltipBgColor:
                                    Color.fromARGB(255, 228, 220, 219)
                                        .withOpacity(0.8),
                              ),
                            ),
                            gridData: FlGridData(show: false),
                            titlesData: FlTitlesData(
                              bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                reservedSize: 30,
                                interval: 10,
                                showTitles: false,
                                getTitlesWidget: (value, meta) {
                                  return SideTitleWidget(
                                      axisSide: meta.axisSide,
                                      space: 10,
                                      child: Text("5D"));
                                },
                              )),
                              rightTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              leftTitles: AxisTitles(),
                            ),
                            borderData: FlBorderData(show: false),
                            lineBarsData: [
                              LineChartBarData(
                                  isCurved: false,
                                  curveSmoothness: 0,
                                  color: colorBrandWarren,
                                  barWidth: 4,
                                  isStrokeCapRound: true,
                                  dotData: FlDotData(show: false),
                                  belowBarData: BarAreaData(show: false),
                                  spots: snapshot.data)
                            ],
                            minX: 0,
                            maxX: 30,
                            // maxY: 107081,
                            // minY: 100900,
                            maxY: 104861,
                            minY: 103442,
                          ),
                          swapAnimationDuration:
                              const Duration(milliseconds: 250),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Divider(
                thickness: 1,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Botao extends StatelessWidget {
  const Botao({
    Key? key,
    required this.dias,
  }) : super(key: key);

  final String dias;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // setState(() async {
        //   await getSpots(30);
        // });
      },
      child: Container(
        padding: const EdgeInsets.all(6),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: colorHideOn, borderRadius: BorderRadius.circular(5)),
        child: Text(
          dias,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class BotaoFiltro extends StatelessWidget {
  BotaoFiltro({
    Key? key,
    required this.filter,
  }) : super(key: key);

  final String filter;

  CoinRepository repo = CoinRepository();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ;
      },
      child: Container(
        padding: const EdgeInsets.all(6),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: colorHideOn, borderRadius: BorderRadius.circular(5)),
        child: Text(
          filter,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
