import 'package:everest_crypto/app/domain/entities/coin_entity.dart';
import 'package:everest_crypto/app/domain/repositories/get_all_coins_repository.dart';

import '../datasources/coin_datasource.dart';

class CoinRepositoryImp implements GetAllCoinsRepository {
  final CoinDatasource _datasource;

  CoinRepositoryImp(this._datasource);
  @override
  Future<List<CoinEntity>> getAllCoins() async {
    return await _datasource.getAllCoins();
  }
}
