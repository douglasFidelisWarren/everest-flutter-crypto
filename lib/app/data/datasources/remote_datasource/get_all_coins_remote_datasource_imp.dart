import 'package:dio/dio.dart';
import 'package:everest_crypto/app/domain/entities/coin_entity.dart';

import '../../dtos/coin_dto.dart';
import '../get_all_coins_datasource.dart';
import 'endpoints/coinbase.dart';

class GetAllCoinsRemoteDatasourceImp implements GetAllCoinsDatasource {
  final Dio _dio;
  GetAllCoinsRemoteDatasourceImp(this._dio);

  @override
  Future<List<CoinEntity>> getAllCoins() async {
    List<CoinEntity> coins = [];

    try {
      final response = await _dio.get(Coinbase.getAllCoins());

      coins = List.from(
          response.data['data'].map((coin) => CoinDto.fromJson(coin)));
    } catch (error) {
      print(error.toString());
    }
    // print(coins[0].name);
    // print(coins[0].id);
    // print(coins[0].image);
    // print(coins[0].latest);
    // print(coins[0].amount);
    // print(coins[0].symbol);

    return coins;
  }
}
