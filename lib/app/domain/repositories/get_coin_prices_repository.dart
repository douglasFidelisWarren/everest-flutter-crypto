import 'package:decimal/decimal.dart';

abstract class GetCoinPricesRepository {
  Future<List<Decimal>> getCoinPrices(String coinId, String period);
}
