import 'package:decimal/decimal.dart';

import 'package:everest_crypto/app/domain/entities/chart_config_entity.dart';
import 'package:everest_crypto/app/domain/repositories/get_chart_config_repository.dart';

abstract class GetChartConfigUsecase {
  ChartConfigEntity getChartConfig(List<Decimal> prices);
}

class GetChartConfigUsecaseImp implements GetChartConfigUsecase {
  final GetChartConfigRepository _repository;

  GetChartConfigUsecaseImp(this._repository);
  @override
  ChartConfigEntity getChartConfig(List<Decimal> prices) {
    return _repository.getChartConfig(prices);
  }
}
