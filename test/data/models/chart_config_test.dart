import 'package:everest_crypto/app/data/models/chart_config.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    "WHEN entity is generated THEN all attributes are required",
    () {
      ChartConfig config =
          ChartConfig(period: 1, percent: 1, max: 1, min: 1, spots: []);
      final period = config.period;
      expect(config.period, period);
    },
  );
}
