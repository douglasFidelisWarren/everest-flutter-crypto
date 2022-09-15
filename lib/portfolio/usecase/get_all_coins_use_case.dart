import 'package:dio/dio.dart';

import '../model/coin.dart';
import '../repositories/coin_repository.dart';

class GetAllCoinsUseCase {
  final CoinRepository repository = CoinRepository(Dio());

  List<Coin> getAllCoins() {
    return repository.getAllCoins();
  }
}
