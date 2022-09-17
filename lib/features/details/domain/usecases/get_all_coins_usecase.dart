import 'package:everest_crypto/features/details/domain/entities/coin_entity.dart';

import '../repositories/coin_repository.dart';

abstract class GetAllCoinsUsecase {
  Future<List<CoinEntity>> getAllCoins();
}

class GetAllCoinsUsecaseImp implements GetAllCoinsUsecase {
  final CoinRepository _repository;

  GetAllCoinsUsecaseImp(this._repository);
  @override
  Future<List<CoinEntity>> getAllCoins() async {
    return await _repository.getAllCoins();
  }
}
