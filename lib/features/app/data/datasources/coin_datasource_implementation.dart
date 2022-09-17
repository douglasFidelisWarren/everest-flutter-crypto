import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:everest_crypto/features/details/data/datasources/coin_datasource.dart';
import 'package:everest_crypto/features/details/data/datasources/endpoints/coinbase.dart';
import 'package:everest_crypto/features/details/data/models/coin_model.dart';
import 'package:everest_crypto/features/details/domain/entities/coin_entity.dart';

class CoinDatasourceImplementation implements CoinDatasource {
  final Dio _dio;

  CoinDatasourceImplementation(this._dio);
  @override
  Future<List<CoinModel>> getAllCoins() {
    Future<List<CoinModel>> getAllCoins() async {
      final response = await _dio.get(Coinbase.getAllCoins());
      if (response.statusCode == 200) {
        return List.from(response.data.map((coin) {
          return CoinModel.fromJson(coin);
        }));
      } else {
        return [];
      }
    }

    throw UnimplementedError();
  }
}
