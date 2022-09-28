import 'package:decimal/decimal.dart';

import '../entities/chart_config_entity.dart';

abstract class IChartConfigRepository {
  ChartConfigViewData getChartConfig(List<Decimal> prices);
}
