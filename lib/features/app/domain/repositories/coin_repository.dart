import 'package:everest_crypto/features/details/domain/entities/coin_entity.dart';

abstract class CoinRepository {
  Future<List<CoinEntity>> getAllCoins();
}
