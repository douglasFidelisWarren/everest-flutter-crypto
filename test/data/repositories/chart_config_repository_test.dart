import 'package:everest_crypto/app/data/datasources/get_chart_config_datasource.dart';
import 'package:everest_crypto/app/data/repositories/chart_config_repository_imp.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/fake_repo.dart';

void main() {
  late double max;
  late FakeRepo repo;
  late GetChartConfigDatasource datasource;
  late ChartConfigRepositoryImp chartConfigRepositoryImp;

  setUp(() {
    repo = FakeRepo();
    datasource = GetChartConfigDatasource();
    chartConfigRepositoryImp = ChartConfigRepositoryImp(datasource);
  });

  setUp(() {
    max = chartConfigRepositoryImp.getChartConfig(repo.getPrices()).max;
  });

  test("description", () {
    final c = chartConfigRepositoryImp.getChartConfig(repo.getPrices());
    expect(c.max, max);
  });
}
