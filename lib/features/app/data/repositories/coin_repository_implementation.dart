import 'package:everest_crypto/features/details/domain/entities/coin_entity.dart';
import 'package:everest_crypto/features/details/domain/repositories/coin_repository.dart';

import '../datasources/coin_datasource.dart';

class CoinRepositoryImplementation implements CoinRepository {
  final CoinDatasource _datasource;

  CoinRepositoryImplementation(this._datasource);
  @override
  Future<List<CoinEntity>> getAllCoins() async {
    return await _datasource.getAllCoins();
  }
}
