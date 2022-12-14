import 'package:decimal/decimal.dart';
import 'package:fl_chart/fl_chart.dart';

import '../entities/chart_config_entity.dart';
import '../repositories/i_chart_config_repository.dart';

abstract class IGetChartConfigUsecase {
  ChartConfigViewData getChartConfig(List<Decimal> prices);
}

class GetChartConfigUsecaseImp implements IGetChartConfigUsecase {
  final IChartConfigRepository _repository;
  GetChartConfigUsecaseImp(this._repository);
  @override
  ChartConfigViewData getChartConfig(List<Decimal> prices) {
    if (prices.isNotEmpty) {
      return _repository.getChartConfig(prices);
    }
    return ChartConfigViewData(period: 1, percent: 1, max: 1, min: 1, spots: [
      const FlSpot(1, 2),
      const FlSpot(2, 3),
    ]);
  }
}
