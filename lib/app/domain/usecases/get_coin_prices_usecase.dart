import 'package:decimal/decimal.dart';

import '../repositories/i_coin_prices_repository.dart';

abstract class IGetCoinPricesUsecase {
  Future<List<Decimal>> getCoinPrices({
    required String coinId,
    required String vScurrency,
    required int days,
  });
}

class GetCoinPricesUsecaseImp implements IGetCoinPricesUsecase {
  final ICoinPricesRepository _repository;

  GetCoinPricesUsecaseImp(this._repository);
  @override
  Future<List<Decimal>> getCoinPrices(
      {required String coinId,
      required String vScurrency,
      required int days}) async {
    return await _repository.getCoinPrices(coinId, vScurrency, days);
  }
}
