import 'package:fl_chart/fl_chart.dart';

import '../../domain/entities/chart_config_entity.dart';

class ChartConfig extends ChartConfigViewData {
  ChartConfig({
    required double period,
    required double percent,
    required double max,
    required double min,
    required List<FlSpot> spots,
  }) : super(
          period: period,
          percent: percent,
          max: max,
          min: min,
          spots: spots,
        );
}
