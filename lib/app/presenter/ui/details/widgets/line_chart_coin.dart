import 'package:everest_crypto/app/domain/entities/chart_config_entity.dart';
import 'package:everest_crypto/app/presenter/controllers/providers/get_all_coins_provider.dart';
import 'package:everest_crypto/app/presenter/ui/shared/formater.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../controllers/providers/get_coin_prices_provider.dart';
import '../../shared/styles.dart';
import '../../../../data/datasources/spots_datasource.dart';

final diaProvider = StateProvider<String>((ref) => 'year');
final maxProvider = StateProvider<double>((ref) => 105461);
final minProvider = StateProvider<double>((ref) => 102042);
final selected = StateProvider<int>((ref) {
  return 0;
});

class LineChartCoin extends HookConsumerWidget {
  const LineChartCoin(this.config, {Key? key}) : super(key: key);
  final ChartConfigEntity config;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SpotsDatasource datasource = SpotsDatasource();
    print(config.max);
    //ref.watch(selected) == index ? Colors.red : Colors.green),

    Widget custom(String text, int index, String period) {
      return TextButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(2),
            alignment: Alignment.center,
            minimumSize: const Size(30, 25),
            backgroundColor:
                ref.watch(selected) == index ? colorHideOn : colorHideOff
            //fixedSize: Size(5, 5)
            ),
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.w900,
              color: ref.watch(selected) == index
                  ? colorBlackText
                  : colorGraySubtitle),
        ),
        onPressed: () async {
          ref
              .read(coinPricesNotifierProvider.notifier)
              .getCoinPrices("5b71fc48-3dd3-540c-809b-f8c94d0e68b5", period);
          ref.watch(selected.state).state = index;
        },
      );
    }

    String dia = ref.watch(diaProvider);
    double? rangeY;
    Future<List<FlSpot>> getSpots(String period) async {
      List<FlSpot> spots = await datasource.getSpots(dia);
      rangeY = double.parse((spots.length).toString());
      return spots;
    }

    Future<List<FlSpot>> spots = getSpots(dia);
    return AspectRatio(
      aspectRatio: 1.5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: FutureBuilder(
                future: spots,
                builder: (context, AsyncSnapshot snapshot) {
                  return Visibility(
                    visible: snapshot.hasData,
                    replacement:
                        const Center(child: CircularProgressIndicator()),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: LineChart(
                        LineChartData(
                          lineTouchData: LineTouchData(
                            getTouchedSpotIndicator: (barData, spotIndexes) {
                              return spotIndexes.map((index) {
                                return TouchedSpotIndicatorData(
                                  FlLine(
                                    color: colorBrandWarren,
                                    strokeWidth: 2,
                                  ),
                                  FlDotData(
                                    show: true,
                                  ),
                                );
                              }).toList();
                            },
                            handleBuiltInTouches: true,
                            touchTooltipData: LineTouchTooltipData(
                              getTooltipItems: (touchedSpots) {
                                return touchedSpots.map((touchedSpot) {
                                  return LineTooltipItem(
                                    number.format(touchedSpot.y),
                                    const TextStyle(
                                      color: colorBlackText,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }).toList();
                              },
                              tooltipRoundedRadius: 5,
                              tooltipBgColor: colorGrayDivider.withOpacity(.8),
                            ),
                          ),
                          gridData: FlGridData(show: false),
                          titlesData: FlTitlesData(
                            bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                              showTitles: false,
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
                            show: true,
                            border: const Border(
                              bottom:
                                  BorderSide(color: colorGrayDivider, width: 2),
                            ),
                          ),
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
                                spots: config.spots)
                          ],
                          minX: 0,
                          maxX: config.period,
                          maxY: config.max,
                          minY: config.min,
                        ),
                        swapAnimationDuration:
                            const Duration(milliseconds: 250),
                      ),
                    ),
                  );
                },
              ),
            ),
            // const Divider(
            //   thickness: 1,
            // ),
            Row(
              children: [
                custom("5D", 1, "hour"),
                custom("15D", 2, "day"),
                custom("30D", 3, "week"),
                custom("45D", 4, "month"),
                custom("90D", 5, "year"),
              ],
            )
          ],
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

  final String dia;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SpotsDatasource teste = SpotsDatasource();
    getX() async {
      ref.read(maxProvider.notifier).state =
          await teste.getMaxX(ref.watch(diaProvider));
      ref.read(minProvider.notifier).state =
          await teste.getMinX(ref.watch(diaProvider));
    }

    return TextButton(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(2),
          alignment: Alignment.center,
          minimumSize: const Size(30, 25),
          backgroundColor: colorHideOn
          //fixedSize: Size(5, 5)
          ),
      child: Text(
        "${dia}D",
        style: const TextStyle(
          fontWeight: FontWeight.w900,
          //color: seleciona ? colorBlackText : colorBrandWarren
        ),
      ),
      onPressed: () {
        getX();

        ref.read(diaProvider.notifier).state = dia;
      },
    );
  }
}
