import 'package:decimal/decimal.dart';
import 'package:everest_crypto/app/domain/usecases/get_chart_config_usecase.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:everest_crypto/app/domain/entities/chart_config_entity.dart';

class GetChartConfigNotifier extends StateNotifier<ChartConfigEntity> {
  final GetChartConfigUsecase _usecase;
  GetChartConfigNotifier(this._usecase)
      : super(ChartConfigEntity(
          period: 1,
          max: 2,
          min: 3,
          spots: [FlSpot(0, 1)],
        ));

  void getChartConfig(List<Decimal> prices) {
    // state = ChartConfigEntity(
    //   period: 0,
    //   max: 0,
    //   min: 0,
    //   spots: [],
    // );
    state = _usecase.getChartConfig(prices);
  }
}
