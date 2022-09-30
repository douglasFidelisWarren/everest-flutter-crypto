import 'package:decimal/decimal.dart';

import '../../domain/entities/chart_config_entity.dart';
import '../../domain/repositories/i_chart_config_repository.dart';
import '../datasources/get_chart_config_datasource.dart';

class ChartConfigRepositoryImp implements IChartConfigRepository {
  final GetChartConfigDatasource _datasource;

  ChartConfigRepositoryImp(this._datasource);
  @override
  ChartConfigViewData getChartConfig(List<Decimal> prices) {
    return _datasource.getChartConfig(prices);
  }
}
