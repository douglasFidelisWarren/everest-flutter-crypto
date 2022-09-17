import 'package:everest_crypto/app/domain/entities/coin_entity.dart';

abstract class CoinDatasource {
  Future<List<CoinEntity>> getAllCoins();
}
