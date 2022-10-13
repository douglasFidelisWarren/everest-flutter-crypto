// ignore_for_file: invalid_use_of_protected_member

import 'package:everest_crypto/app/domain/entities/chart_config_entity.dart';
import 'package:decimal/decimal.dart';
import 'package:everest_crypto/app/domain/repositories/i_chart_config_repository.dart';
import 'package:everest_crypto/app/domain/usecases/get_chart_config_usecase.dart';
import 'package:everest_crypto/app/presenter/controllers/notifiers/get_chart_config_notifier.dart';
import 'package:flutter_test/flutter_test.dart';

class ChartConfigRepositoryFake implements IChartConfigRepository {
  @override
  ChartConfigViewData getChartConfig(List<Decimal> prices) {
    return ChartConfigViewData(
        period: 1, percent: 1, max: 1, min: 1, spots: []);
  }
}

void main() {
  test(
    "WHEN GetChartConfigNotifier called THEN returns ChartConfigViewData",
    () async {
      ChartConfigRepositoryFake repo;
      repo = ChartConfigRepositoryFake();
      GetChartConfigUsecaseImp usecase;
      usecase = GetChartConfigUsecaseImp(repo);
      GetChartConfigNotifier notifier;
      notifier = GetChartConfigNotifier(usecase, [Decimal.parse("1")]);
      notifier.getChartConfig([Decimal.parse("1")]);
      notifier.state =
          ChartConfigViewData(period: 1, percent: 1, max: 1, min: 1, spots: []);
      ChartConfigViewData congfig = notifier.state;

      expect(notifier.state, equals(congfig));
    },
  );
}
