import 'package:decimal/decimal.dart';

import '../repositories/coin_prices_repository.dart';

abstract class IGetCoinPricesUsecase {
  Future<List<Decimal>> getCoinPrices(
      String coinId, String vScurrency, int fromTime, int toTime);
}

class GetCoinPricesUsecaseImp implements IGetCoinPricesUsecase {
  final ICoinPricesRepository _repository;

  GetCoinPricesUsecaseImp(this._repository);
  @override
  Future<List<Decimal>> getCoinPrices(
      String coinId, String vScurrency, int fromTime, int toTime) async {
    return await _repository.getCoinPrices(
        coinId, vScurrency, fromTime, toTime);
  }
}
