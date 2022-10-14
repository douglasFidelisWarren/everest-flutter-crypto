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

  Future<Response> getCoinPrices(
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
    Map<String, Decimal>
        userCoins, //Esse map carrega os ids e quantidade de cada moeda do usuario.
    String vScurrency,
  ) {
    return _dio.get('/coins/markets', queryParameters: {
      'vs_currency': vScurrency,

      //Lista com cryptos do usuario está mockada na query, porteriomente serão usadas as
      //keys de userCoin para trazer alimentar parametro 'ids'.

      'ids': 'bitcoin, ethereum, litecoin, usd-coin, avalanche-2, atom, chiliz',
    });
  }

  Future<Response> getCoinConverction({
    required String coinId,
    required String vScurrency,
  }) {
    return _dio.get(
      '/coins/markets',
      queryParameters: {'vs_currency': vScurrency, 'ids': coinId},
    );
  }
}
