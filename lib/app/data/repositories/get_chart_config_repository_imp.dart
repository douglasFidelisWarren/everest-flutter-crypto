import 'package:decimal/decimal.dart';

import '../../domain/entities/chart_config_entity.dart';
import '../../domain/repositories/chart_config_repository.dart';
import '../datasources/get_chart_config_datasource.dart';

class GetChartConfigRepositoryImp implements IChartConfigRepository {
  final GetChartConfigDatasource _datasource;

  GetChartConfigRepositoryImp(this._datasource);
  @override
  ChartConfigEntity getChartConfig(List<Decimal> prices) {
    return _datasource.getChartConfig(prices);
  }
}
