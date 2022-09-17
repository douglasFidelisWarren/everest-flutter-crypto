import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:everest_crypto/app/data/datasources/coin_datasource.dart';
import 'package:everest_crypto/app/data/datasources/remote_datasource/endpoints/coinbase.dart';
import 'package:everest_crypto/app/data/dtos/coin_dto.dart';

class CoinRemoteDatasourceImplementation implements CoinDatasource {
  final Dio _dio;
  CoinRemoteDatasourceImplementation(this._dio);

  @override
  Future<List<CoinDto>> getAllCoins() {
    Future<List<CoinDto>> getAllCoins() async {
      final response = await _dio.get(Coinbase.getAllCoins());
      if (response.statusCode == 200) {
        return List.from(response.data.map((coin) {
          return CoinDto.fromJson(coin);
        }));
      } else {
        return [];
      }
    }

    throw UnimplementedError();
  }
}
