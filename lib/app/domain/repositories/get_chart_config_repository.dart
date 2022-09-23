import 'package:decimal/decimal.dart';

import '../entities/chart_config_entity.dart';

abstract class IGetChartConfigRepository {
  ChartConfigEntity getChartConfig(List<Decimal> prices);
}
