import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/usecases/get_coin_prices_usecase.dart';

class CoinPricesNotifier extends StateNotifier<AsyncValue<List<Decimal>>> {
  final GetCoinPricesUsecaseImp _usecase;
  CoinPricesNotifier(this._usecase) : super(const AsyncData([]));

  Future<void> getCoinPrices(String coinId, String vScurrency, int days) async {
    // state = const AsyncLoading();
    state = AsyncData(await _usecase.getCoinPrices(coinId, vScurrency, days));
  }
}
