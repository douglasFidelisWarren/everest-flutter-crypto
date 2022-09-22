import 'package:dio/dio.dart';

class GenckoEndpoints {
  final Dio _dio;

  GenckoEndpoints(this._dio);

  Future<Response> getAllCoins(String vScurrency) {
    return _dio.get('/coins/markets', queryParameters: {
      'vs_currency': vScurrency,
    });
  }

  Future<Response> getprices(
      String coinId, String vScurrency, int fromTime, int toTime) {
    print(
        "https://api.coingecko.com/api/v3/coins/$coinId/market_chart/range?vs_currency=$vScurrency&from=$fromTime&to=$toTime");
    return _dio.get('/coins/$coinId/market_chart/range', queryParameters: {
      'vs_currency': vScurrency,
      'from': fromTime,
      'to': toTime,
    });
    // return _dio.get('/coins/$coinId/market_chart/range', queryParameters: {
    //   'vs_currency': vScurrency,
    //   'from': fromTime,
    //   'to': toTime,
    // });
  }
}
