import 'package:decimal/decimal.dart';
import 'package:dio/dio.dart';

class GenckoEndpoints {
  final Dio _dio;

  GenckoEndpoints(this._dio);

  Future<Response> getAllCoins(String vScurrency) {
    return _dio.get('/coins/markets', queryParameters: {
      'vs_currency': vScurrency,
    });
  }

  Future<Response> getPrices(
    String coinId,
    String vScurrency,
    int days,
  ) {
    return _dio.get('/coins/$coinId/market_chart', queryParameters: {
      'vs_currency': vScurrency,
      'days': days,
    });
  }

  Future<Response> getCoinsWallet(
    Map<String, Decimal> userCoin,
    String vScurrency,
  ) {
    return _dio.get('/coins/markets', queryParameters: {
      'vs_currency': 'brl',
      'ids': 'bitcoin, ethereum, litecoin, usd-coin, avalanche-2, atom, chiliz',
      'order': 'market_cap_desc',
      'per_page': 100,
      'sparkline': false,
    });
  }
}
