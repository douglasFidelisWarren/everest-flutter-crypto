import 'package:decimal/decimal.dart';

import '../repositories/get_coin_prices_repository.dart';

abstract class GetCoinPricesUsecase {
  Future<List<Decimal>> getCoinPrices(String coinId);
}

class GetCoinPricesUsecaseImp implements GetCoinPricesUsecase {
  final GetCoinPricesRepository _repository;

  GetCoinPricesUsecaseImp(this._repository);
  @override
  Future<List<Decimal>> getCoinPrices(String coinId) async {
    return await _repository.getCoinPrices(coinId);
  }
}
