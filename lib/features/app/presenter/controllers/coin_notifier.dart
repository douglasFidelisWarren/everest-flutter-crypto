import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:everest_crypto/features/details/domain/usecases/get_all_coins_usecase.dart';

import '../../details/domain/entities/coin_entity.dart';

class CoinNotifier extends StateNotifier<List<CoinEntity>> {
  final GetAllCoinsUsecase _usecase;
  CoinNotifier(this._usecase) : super([]);

  Future<void> getAllCoins() async {
    state = [];
    state = await _usecase.getAllCoins();
  }
}
