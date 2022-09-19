import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/usecases/get_coin_prices_usecase.dart';

class GetCoinPricesNotifier extends StateNotifier<AsyncValue<List<Decimal>>> {
  final GetCoinPricesUsecase _usecase;
  GetCoinPricesNotifier(this._usecase) : super(const AsyncData([]));

  Future<void> getCoinPrices(String coinId, String period) async {
    //state = const AsyncLoading();
    state = AsyncData(await _usecase.getCoinPrices(coinId, period));
  }
}
