import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:everest_crypto/app/domain/usecases/get_all_coins_usecase.dart';

import '../../../domain/entities/coin_entity.dart';

class GetAllCoinsNotifier extends StateNotifier<AsyncValue<List<CoinEntity>>> {
  final GetAllCoinsUsecase _usecase;
  GetAllCoinsNotifier(this._usecase) : super(const AsyncData([]));

  Future<void> getAllCoins() async {
    state = const AsyncLoading();
    state = AsyncData(await _usecase.getAllCoins());
  }
}
