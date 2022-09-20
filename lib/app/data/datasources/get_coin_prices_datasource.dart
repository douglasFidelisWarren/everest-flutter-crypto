import 'package:decimal/decimal.dart';

abstract class GetCoinPricesDatasource {
  Future<List<Decimal>> getCoinPrices(String coinId, String period);
}
