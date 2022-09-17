import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../portfolio/repositories/coin_repository.dart';
import '../../../../shared/styles.dart';

final diaProvider = StateProvider<int>(
  (ref) => 1,
);

class LineChartCoin extends ConsumerWidget {
  const LineChartCoin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CoinRepository repo = CoinRepository(Dio());
    int dias = ref.watch(diaProvider);
    Future<List<FlSpot>> getSpots(int range) async {
      List<FlSpot> spots = await repo.getSpots(dias);
      return spots;
    }

    int dia = 1;

    Future<List<FlSpot>> spots = getSpots(dias);
    return AspectRatio(
      aspectRatio: 2,
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0, left: 6.0),
                  child: FutureBuilder(
                    // initialData: const [
                    //   FlSpot(0, 100000),
                    // ],
                    future: spots,
                    builder: (context, AsyncSnapshot snapshot) {
                      return Visibility(
                        visible: snapshot.hasData,
                        replacement:
                            const Center(child: CircularProgressIndicator()),
                        child: LineChart(
                          LineChartData(
                            lineTouchData: LineTouchData(
                              handleBuiltInTouches: true,
                              touchTooltipData: LineTouchTooltipData(
                                tooltipBgColor:
                                    colorGrayDivider.withOpacity(0.8),
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
                                      child: Text("$dias"));
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
                            borderData: FlBorderData(
                                show: false,
                                border: const Border(
                                    bottom: BorderSide(
                                        color: colorGrayDivider, width: 4))),
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
                            maxY: 114861,
                            minY: 100442,
                          ),
                          swapAnimationDuration:
                              const Duration(milliseconds: 250),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              Row(
                children: [
                  TextBtn(dia: 5),
                  TextBtn(dia: 6),
                  TextBtn(dia: 7),
                  TextBtn(dia: 8)
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class RangeButton extends ConsumerWidget {
  const RangeButton({
    Key? key,
    required this.dia,
  }) : super(key: key);

  final int dia;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        ref.read(diaProvider.state).state = dia;
      },
      child: Container(
        padding: const EdgeInsets.all(6),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: colorHideOn, borderRadius: BorderRadius.circular(5)),
        child: Text(
          "${dia}D",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class TextBtn extends ConsumerWidget {
  const TextBtn({
    Key? key,
    required this.dia,
  }) : super(key: key);

  final int dia;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(2),
          alignment: Alignment.center,
          minimumSize: Size(30, 25),
          backgroundColor: colorHideOn
          //fixedSize: Size(5, 5)
          ),
      child: Text(
        "${dia}D",
        style: TextStyle(
          fontWeight: FontWeight.w900,
          //color: seleciona ? colorBlackText : colorBrandWarren
        ),
      ),
      onPressed: () {
        //ref.read(indexProvider.state).state = dia;
        ref.read(diaProvider.state).state = dia;
        //ref.read(selecionaProvider.state).state = !seleciona;
      },
    );
  }
}


// TextButton(
//       style: ElevatedButton.styleFrom(
//           padding: EdgeInsets.all(2),
//           alignment: Alignment.center,
//           minimumSize: Size(30, 25),
//           backgroundColor: colorHideOn
//           //fixedSize: Size(5, 5)
//           ),
//       child: Text(
//         "${dia}D",
//         style: TextStyle(
//             fontWeight: FontWeight.w900,
//             color: seleciona ? colorBlackText : colorBrandWarren),
//       ),
//       onPressed: () {
//         //ref.read(indexProvider.state).state = dia;
//         ref.read(diaProvider.state).state = dia;
//         ref.read(selecionaProvider.state).state = !seleciona;
//       },
//     );