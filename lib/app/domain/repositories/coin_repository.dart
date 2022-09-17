import 'package:everest_crypto/app/domain/entities/coin_entity.dart';

abstract class CoinRepository {
  Future<List<CoinEntity>> getAllCoins();
}
