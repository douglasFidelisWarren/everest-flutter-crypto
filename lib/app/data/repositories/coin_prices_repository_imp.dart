import 'package:decimal/decimal.dart';

import '../../domain/repositories/coin_prices_repository.dart';
import '../datasources/api/genckoEndpoints.dart';

class CoinPricesRepositoryImp implements ICoinPricesRepository {
  final GenckoEndpoints genkcoEndpoint;

  CoinPricesRepositoryImp(this.genkcoEndpoint);

  @override
  Future<List<Decimal>> getCoinPrices(
      String coinId, String vScurrency, int days) async {
    List<Decimal> prices = [];

    final response = await genkcoEndpoint.getprices(coinId, vScurrency, days);
    List<dynamic> list = response.data['prices'];

    for (var i = 0; i < list.length; i++) {
      prices.add(Decimal.fromJson("${list[i][1]}"));
      i += 3;
    }
    print("PREÇOS => $coinId - $days");
    print(prices);
    return prices;
  }
}
