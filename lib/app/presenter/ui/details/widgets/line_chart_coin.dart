import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/entities/chart_config_entity.dart';
import '../../../../domain/entities/coins_view_data.dart';
import '../../../controllers/providers/chart_config_provider.dart';
import '../../../controllers/providers/coin_prices_provider.dart';
import '../../shared/formater.dart';
import '../../shared/styles.dart';

final selectedProvider = StateProvider<int>((ref) => 5);

class LineChartCoin extends ConsumerWidget {
  const LineChartCoin(this.coin, {Key? key}) : super(key: key);
  final CoinViewData coin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ChartConfigViewData config = ref.watch(chartConfigProvider);
    Widget custom(int period) {
      return TextButton(
        key: Key("$period"),
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(2),
            alignment: Alignment.center,
            minimumSize: const Size(30, 25),
            backgroundColor: ref.watch(selectedProvider) == period
                ? colorHideOn
                : colorHideOff),
        child: Text(
          "${period}D",
          style: TextStyle(
              fontWeight: FontWeight.w900,
              color: ref.watch(selectedProvider) == period
                  ? colorBlackText
                  : colorGraySubtitle),
        ),
        onPressed: () async {
          await ref
              .read(coinPricesNotifierProvider.notifier)
              .getCoinPrices(coinId: coin.id, vScurrency: "brl", days: period);
          ref
              .read(chartConfigProvider.notifier)
              .getChartConfig(ref.watch(coinPricesNotifierProvider));
          ref.watch(selectedProvider.state).state = period;
        },
      );
    }

    return AspectRatio(
      aspectRatio: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Visibility(
              visible: config.spots.isNotEmpty,
              replacement: const Center(
                  child: CircularProgressIndicator(
                color: colorBrandWarren,
              )),
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: LineChart(
                  LineChartData(
                    lineTouchData: LineTouchData(
                      handleBuiltInTouches: false,
                    ),
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
                          barWidth: 2.7,
                          isStrokeCapRound: true,
                          dotData: FlDotData(show: false),
                          belowBarData: BarAreaData(show: false),
                          spots: config.spots)
                    ],
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
