import 'package:decimal/decimal.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../domain/entities/chart_config_entity.dart';

class GetChartConfigDatasource {
  ChartConfigEntity getChartConfig(List<Decimal> prices) {
    print("teste");
    print(prices);
    double period = double.parse(prices.length.toString());
    double max = 0;
    for (var price in prices) {
      double priceD = double.parse(price.toString());
      if (priceD > max) {
        max = priceD;
      }
    }
    double min = max;
    for (var price in prices) {
      if (double.parse(price.toString()) < min) {
        min = double.parse(price.toString());
      }
    }

    List<FlSpot> spots = [];

    for (var i = 0; i < prices.length; i++) {
      String valor = double.parse(prices[i].toString()).toStringAsFixed(2);
      spots.add(
        FlSpot(i.toDouble(), (double.parse(valor))),
      );
    }

    ChartConfigEntity chartConfigEntity = ChartConfigEntity(
      max: max,
      min: min,
      period: period,
      spots: spots,
    );

    return chartConfigEntity;
  }
}
