import 'package:decimal/decimal.dart';
import 'package:everest_crypto/app/domain/entities/chart_config_entity.dart';
import 'package:fl_chart/fl_chart.dart';

class GetChartConfigDatasource {
  ChartConfigEntity getChartConfig(List<Decimal> prices) {
    double period = double.parse(prices.length.toString());
    double max = 0;
    for (var price in prices) {
      if (double.parse(price.toString()) > max) {
        max = double.parse(price.toString());
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
