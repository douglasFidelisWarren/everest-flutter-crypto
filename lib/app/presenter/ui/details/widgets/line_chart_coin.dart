import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:everest_crypto/app/presenter/controllers/providers/get_chart_config_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/entities/chart_config_entity.dart';
import '../../../controllers/providers/get_coin_prices_provider.dart';
import '../../shared/formater.dart';
import '../../shared/styles.dart';

// final diaProvider = StateProvider<String>((ref) => 'year');
// final change = StateProvider<double>((ref) => 0);
// final minProvider = StateProvider<double>((ref) => 102042);
final selected = StateProvider<int>((ref) => 0);

class LineChartCoin extends HookConsumerWidget {
  const LineChartCoin(this.config, this.coin, {Key? key}) : super(key: key);
  final ChartConfigEntity config;
  final CoinViewData coin;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget custom(
      int period,
    ) {
      return TextButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(2),
            alignment: Alignment.center,
            minimumSize: const Size(30, 25),
            backgroundColor:
                ref.watch(selected) == period ? colorHideOn : colorHideOff),
        child: Text(
          "${period}D",
          style: TextStyle(
              fontWeight: FontWeight.w900,
              color: ref.watch(selected) == period
                  ? colorBlackText
                  : colorGraySubtitle),
        ),
        onPressed: () async {
          await ref
              .read(coinsNotifierProvider.notifier)
              .getCoinPrices(coin.id, "brl", period);
          ref
              .read(chartConfigProvider.notifier)
              .getChartConfig(ref.watch(coinsNotifierProvider).value!);
          ref.watch(selected.state).state = period;
        },
      );
    }

    return AspectRatio(
      aspectRatio: 1.5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Visibility(
              visible: config.spots.isNotEmpty,
              replacement: const Center(child: CircularProgressIndicator()),
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
                        )),
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        leftTitles: AxisTitles()),
                    borderData: FlBorderData(
                      show: true,
                      border: const Border(
                        bottom: BorderSide(color: colorGrayDivider, width: 2),
                      ),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                          isStrokeJoinRound: false,
                          isCurved: false,
                          curveSmoothness: 0,
                          color: colorBrandWarren,
                          barWidth: 2,
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
                  swapAnimationDuration: const Duration(milliseconds: 250),
                ),
              ),
            )),
            Row(
              children: [
                custom(5),
                custom(15),
                custom(30),
                custom(45),
                custom(90),
              ],
            )
          ],
        ),
      ),
    );
  }
}
