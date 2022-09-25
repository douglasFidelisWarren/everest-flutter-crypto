import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartConfigEntity {
  final double period;
  final double percent;
  final double max;
  final double min;
  final List<FlSpot> spots;

  ChartConfigEntity({
    required this.period,
    required this.percent,
    required this.max,
    required this.min,
    required this.spots,
  });
}
