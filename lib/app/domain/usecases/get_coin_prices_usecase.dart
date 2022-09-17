import 'package:decimal/decimal.dart';

abstract class GetCoinPricesUsecase {
  Future<List<Decimal>> getCoinPrices(int id);
}

class GetCoinPricesUsecaseImp implements GetCoinPricesUsecase {
  @override
  Future<List<Decimal>> getCoinPrices(int id) {
    // TODO: implement getCoinPrices
    throw UnimplementedError();
  }
}
