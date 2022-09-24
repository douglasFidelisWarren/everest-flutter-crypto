import 'package:decimal/decimal.dart';

import '../entities/chart_config_entity.dart';
import '../repositories/chart_config_repository.dart';

abstract class GetChartConfigUsecase {
  ChartConfigEntity getChartConfig(List<Decimal> prices);
}

class GetChartConfigUsecaseImp implements GetChartConfigUsecase {
  final IChartConfigRepository _repository;

  GetChartConfigUsecaseImp(this._repository);
  @override
  ChartConfigEntity getChartConfig(List<Decimal> prices) {
    return _repository.getChartConfig(prices);
  }
}
