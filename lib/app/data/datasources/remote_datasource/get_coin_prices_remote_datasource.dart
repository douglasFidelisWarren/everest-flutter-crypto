import 'package:decimal/decimal.dart';
import 'package:dio/dio.dart';

import '../get_coin_prices_datasource.dart';
import 'endpoints/coinbase.dart';

class GetCoinPricesRemoteDatasourceImp implements GetCoinPricesDatasource {
  final Dio _dio;

  GetCoinPricesRemoteDatasourceImp(this._dio);
  @override
  Future<List<Decimal>> getCoinPrices(String coinId, String period) async {
    List<dynamic> list = [];
    List<Decimal> prices = [];

    final response = await _dio.get(
        "https://api.coingecko.com/api/v3/coins/bitcoin/market_chart/range?vs_currency=brl&from=1663813813&to=1663816813");
    list = response.data['prices'];
    for (var list in list) {
      prices.add(Decimal.parse(list[1].toString()));
    }
    prices = prices.reversed.toList();
    return prices;
  }
}
