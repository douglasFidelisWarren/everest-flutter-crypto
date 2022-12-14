import 'package:decimal/decimal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/usecases/get_coin_prices_usecase.dart';

class CoinPricesNotifier extends StateNotifier<List<Decimal>> {
  final GetCoinPricesUsecaseImp _usecase;
  CoinPricesNotifier(this._usecase) : super([]);

  Future<void> getCoinPrices(
      {required String coinId,
      required String vScurrency,
      required int days}) async {
    state = await _usecase.getCoinPrices(
        coinId: coinId, vScurrency: vScurrency, days: days);
  }
}
