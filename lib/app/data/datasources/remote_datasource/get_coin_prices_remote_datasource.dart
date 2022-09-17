import 'package:decimal/decimal.dart';
import 'package:dio/dio.dart';
import 'package:everest_crypto/app/data/datasources/get_coin_prices_datasource.dart';
import 'package:everest_crypto/app/data/datasources/remote_datasource/endpoints/coinbase.dart';

class GetCoinPricesRemoteDatasourceImp implements GetCoinPricesDatasource {
  final Dio _dio;

  GetCoinPricesRemoteDatasourceImp(this._dio);
  @override
  Future<List<Decimal>> getCoinPrices(String coinId) async {
    List<dynamic> list = [];
    List<Decimal> prices = [];

    final response = await _dio.get(Coinbase.getCoinPrices(coinId.toString()));
    list = response.data['data']['prices']['week']['prices'];
    for (var list in list) {
      prices.add(Decimal.parse(list[0].toString()));
    }
    prices = prices.reversed.toList();
    return prices;
  }
}
