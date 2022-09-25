import 'package:everest_crypto/app/domain/entities/chart_config_entity.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartConfigDto extends ChartConfigEntity {
  ChartConfigDto({
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
