import 'package:decimal/decimal.dart';
import 'package:everest_crypto/app/domain/entities/chart_config_entity.dart';

abstract class GetChartConfigRepository {
  ChartConfigEntity getChartConfig(List<Decimal> prices);
}
