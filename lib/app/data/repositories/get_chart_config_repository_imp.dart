import 'package:everest_crypto/app/data/datasources/get_chart_config_datasource.dart';
import 'package:everest_crypto/app/domain/entities/chart_config_entity.dart';

import 'package:decimal/decimal.dart';

import '../../domain/repositories/get_chart_config_repository.dart';

class GetChartConfigRepositoryImp implements GetChartConfigRepository {
  final GetChartConfigDatasource _datasource;

  GetChartConfigRepositoryImp(this._datasource);
  @override
  ChartConfigEntity getChartConfig(List<Decimal> prices) {
    return _datasource.getChartConfig(prices);
  }
}
