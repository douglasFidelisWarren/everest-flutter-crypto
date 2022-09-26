import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entities/chart_config_entity.dart';
import '../../../domain/usecases/get_chart_config_usecase.dart';

class GetChartConfigNotifier extends StateNotifier<ChartConfigViewData> {
  final GetChartConfigUsecase _usecase;
  final List<Decimal> prices;
  GetChartConfigNotifier(this._usecase, this.prices)
      : super(_usecase.getChartConfig(prices));

  void getChartConfig(List<Decimal> prices) =>
      state = _usecase.getChartConfig(prices);
}
