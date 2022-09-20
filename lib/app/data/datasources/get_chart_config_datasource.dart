import 'package:decimal/decimal.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../domain/entities/chart_config_entity.dart';

class GetChartConfigDatasource {
  ChartConfigEntity getChartConfig(List<Decimal> prices) {
    double period = prices.length.toDouble();
    double max = 0;
    double min = 0;

    for (var price in prices) {
      double priceD = price.toDouble();

      if (priceD > max) {
        max = priceD;
        min = max;
      } else {
        if (priceD < max) {
          if (priceD < min) min = priceD;
        }
      }
    }

    List<FlSpot> spots = [];

    for (var i = 0; i < prices.length; i++) {
      double valor = prices[i].toDouble();
      spots.add(
        FlSpot(i.toDouble(), valor),
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
