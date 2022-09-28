import 'package:decimal/decimal.dart';

import '../entities/chart_config_entity.dart';
import '../repositories/ichart_config_repository.dart';

abstract class GetChartConfigUsecase {
  ChartConfigViewData getChartConfig(List<Decimal> prices);
}

class GetChartConfigUsecaseImp implements GetChartConfigUsecase {
  final IChartConfigRepository _repository;

  GetChartConfigUsecaseImp(this._repository);
  @override
  ChartConfigViewData getChartConfig(List<Decimal> prices) {
    return _repository.getChartConfig(prices);
  }
}
