import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/usecases/get_coin_prices_usecase.dart';

class GetCoinPricesNotifier extends StateNotifier<AsyncValue<List<Decimal>>> {
  final IGetCoinPricesUsecase _usecase;
  GetCoinPricesNotifier(this._usecase) : super(const AsyncData([]));

  Future<void> getCoinPrices(
      String coinId, String vScurrency, int fromTime, int toTime) async {
    state = AsyncData(
        await _usecase.getCoinPrices(coinId, vScurrency, fromTime, toTime));
  }
}
