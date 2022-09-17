import 'package:dio/dio.dart';

import '../../dtos/coin_dto.dart';
import '../coin_datasource.dart';
import 'endpoints/coinbase.dart';

class CoinRemoteDatasourceImp implements CoinDatasource {
  final Dio _dio;
  CoinRemoteDatasourceImp(this._dio);

  @override
  Future<List<CoinDto>> getAllCoins() async {
    final response = await _dio.get(Coinbase.getAllCoins());
    if (response.statusCode == 200) {
      return List.from(
        response.data.map((coin) => CoinDto.fromJson(coin)),
      );
    } else {
      return [];
    }
  }
}
