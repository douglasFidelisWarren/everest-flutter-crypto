import 'package:everest_crypto/app/domain/entities/coin_entity.dart';
import 'package:everest_crypto/app/domain/repositories/get_all_coins_repository.dart';

import '../datasources/get_all_coins_datasource.dart';

class GetAllCoinsRepositoryImp implements GetAllCoinsRepository {
  final GetAllCoinsDatasource _datasource;

  GetAllCoinsRepositoryImp(this._datasource);
  @override
  Future<List<CoinEntity>> getAllCoins() async {
    return await _datasource.getAllCoins();
  }
}
