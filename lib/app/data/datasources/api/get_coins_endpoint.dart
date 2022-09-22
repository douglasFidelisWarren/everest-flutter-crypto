import 'package:dio/dio.dart';

class GetCoinsEndpoint {
  final Dio _dio;

  GetCoinsEndpoint(this._dio);

  Future<Response> getAllCoins(String vScurrency) {
    return _dio.get('/coins/markets', queryParameters: {
      'vs_currency': vScurrency,
    });
  }
}
