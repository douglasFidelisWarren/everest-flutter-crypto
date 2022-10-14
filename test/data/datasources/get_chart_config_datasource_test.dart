import 'package:everest_crypto/app/data/datasources/get_chart_config_datasource.dart';
import 'package:everest_crypto/app/domain/entities/chart_config_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/fake_repo.dart';

void main() {
  late GetChartConfigDatasource getChartConfigDatasource;
  late FakeRepo repo;
  late ChartConfigViewData chartConfig;

  setUp(() {
    getChartConfigDatasource = GetChartConfigDatasource();
    repo = FakeRepo();
    chartConfig = getChartConfigDatasource.getChartConfig(repo.getPrices());
  });

  test(
    "WHEN getChartConfig called THEN returns ChartConfigViewData",
    () {
      final config = getChartConfigDatasource.getChartConfig(repo.getPrices());
      expect(config.max, chartConfig.max);
    },
  );
}
