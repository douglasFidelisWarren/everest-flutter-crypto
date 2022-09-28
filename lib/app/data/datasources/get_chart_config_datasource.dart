import 'package:decimal/decimal.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../domain/entities/chart_config_entity.dart';

class GetChartConfigDatasource {
  ChartConfigViewData getChartConfig(List<Decimal> prices) {
    double period = prices.length.toDouble();
    double first = prices.first.toDouble();
    double last = prices.last.toDouble();
    double percent = ((last - first) / first) * 100;
    double max = 0;
    double min = 9999999;
    List<FlSpot> spots = [];

    for (var i = 0; i < prices.length; i++) {
      double priceD = prices[i].toDouble();
      spots.add(FlSpot(i.toDouble(), priceD));

      if (priceD > max) {
        max = priceD;
      }

      if (priceD < min) min = priceD;
    }

    ChartConfigViewData chartConfigEntity = ChartConfigViewData(
      max: max,
      min: min,
      period: period,
      percent: percent,
      spots: spots,
    );
    return chartConfigEntity;
  }
}
