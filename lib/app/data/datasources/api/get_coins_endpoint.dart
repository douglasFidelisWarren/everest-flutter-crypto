import 'package:dio/dio.dart';

class GetCoinsEndpoint {
  final Dio _dio;

  GetCoinsEndpoint(this._dio);

  Future<Response> getAllCoins() {
    return _dio.get(
      'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd',
    );
  }
}
