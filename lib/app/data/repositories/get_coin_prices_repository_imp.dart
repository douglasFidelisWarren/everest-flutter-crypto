import 'package:decimal/decimal.dart';

import '../../domain/repositories/get_coin_prices_repository.dart';
import '../datasources/get_coin_prices_datasource.dart';

class GetCoinPricesRepositoryImp implements GetCoinPricesRepository {
  final GetCoinPricesDatasource _datasource;

  GetCoinPricesRepositoryImp(this._datasource);

  @override
  Future<List<Decimal>> getCoinPrices(String coinId, String period) async {
    return await _datasource.getCoinPrices(coinId, period);
  }
}
