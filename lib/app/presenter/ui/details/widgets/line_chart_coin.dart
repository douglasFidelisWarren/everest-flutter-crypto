import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../data/datasources/spots_datasource.dart';
import '../../portfolio/repositories/coin_repository.dart';
import '../../../../../core/shared/styles.dart';

// maxY: 105461,
// minY: 102042,

final diaProvider = StateProvider<int>(
  (ref) => 1,
);
final maxProvider = StateProvider<double>(
  (ref) => 105461,
);
final minProvider = StateProvider<double>(
  (ref) => 102042,
);

class LineChartCoin extends ConsumerWidget {
  const LineChartCoin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SpotsDatasource teste = SpotsDatasource();
    int dias = ref.watch(diaProvider);
    double? rangeY;
    Future<List<FlSpot>> getSpots(int range) async {
      List<FlSpot> spots = await teste.getSpots(dias);
      rangeY = double.parse((spots.length).toString());
      return spots;
    }

    int dia = 1;

    Future<List<FlSpot>> spots = getSpots(dias);
    return AspectRatio(
      aspectRatio: 1.4,
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
                                tooltipRoundedRadius: 5,
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
                                  isStrokeJoinRound: true,
                                  isCurved: false,
                                  curveSmoothness: 0,
                                  color: colorBrandWarren,
                                  barWidth: 2.5,
                                  isStrokeCapRound: true,
                                  dotData: FlDotData(show: false),
                                  belowBarData: BarAreaData(show: false),
                                  spots: snapshot.data)
                            ],
                            minX: 0,
                            maxX: rangeY,
                            // maxY: 107081,
                            // minY: 100900,
                            // maxY: 105461,
                            // minY: 102042,
                            maxY: ref.read(maxProvider),
                            minY: ref.read(minProvider),
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
                  TextBtn(dia: 15),
                  TextBtn(dia: 30),
                  TextBtn(dia: 45),
                  TextBtn(dia: 90)
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
    SpotsDatasource teste = SpotsDatasource();
    getX() async {
      ref.read(maxProvider.notifier).state = await teste.getMaxX();
      ref.read(minProvider.notifier).state = await teste.getMinX();
    }

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
        getX();
        print(ref.read(maxProvider));
        print(ref.read(minProvider));
        //ref.read(indexProvider.state).state = dia;
        ref.read(diaProvider.notifier).state = dia;
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