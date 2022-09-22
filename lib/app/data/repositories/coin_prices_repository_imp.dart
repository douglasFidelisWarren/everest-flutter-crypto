import 'package:decimal/decimal.dart';

import '../../domain/repositories/coin_prices_repository.dart';
import '../datasources/api/genckoEndpoints.dart';

class CoinPricesRepositoryImp implements ICoinPricesRepository {
  final GenckoEndpoints genkcoEndpoint;

  CoinPricesRepositoryImp(this.genkcoEndpoint);

  @override
  Future<List<Decimal>> getCoinPrices(
      String coinId, String vScurrency, int fromTime, int toTime) async {
    List<Decimal> prices = [];
    final response =
        await genkcoEndpoint.getprices(coinId, vScurrency, fromTime, toTime);
    prices = response.data['prices'];

    return prices;
  }
}
