import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entities/chart_config_entity.dart';
import '../../../domain/usecases/get_chart_config_usecase.dart';

class GetChartConfigNotifier extends StateNotifier<ChartConfigEntity> {
  final GetChartConfigUsecase _usecase;
  GetChartConfigNotifier(this._usecase)
      : super(ChartConfigEntity(
          period: 1,
          max: 2,
          min: 3,
          spots: [],
        ));

  void getChartConfig(List<Decimal> prices) {
    state = _usecase.getChartConfig(prices);
  }
}
