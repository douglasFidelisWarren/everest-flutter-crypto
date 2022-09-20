import 'package:fl_chart/fl_chart.dart';

class ChartConfigEntity {
  final double period;
  final double max;
  final double min;
  final List<FlSpot> spots;

  ChartConfigEntity({
    required this.period,
    required this.max,
    required this.min,
    required this.spots,
  });
}
