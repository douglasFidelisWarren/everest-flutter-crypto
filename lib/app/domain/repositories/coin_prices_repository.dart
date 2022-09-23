import 'package:decimal/decimal.dart';

abstract class ICoinPricesRepository {
  Future<List<Decimal>> getCoinPrices(
      String coinId, String vScurrency, int days);
}
