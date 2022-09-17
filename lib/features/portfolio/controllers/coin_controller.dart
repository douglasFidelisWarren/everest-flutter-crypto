import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/coin.dart';
import '../usecase/get_all_coins_use_case.dart';

class CoinController extends StateNotifier<List<Coin>> {
  CoinController() : super([]) {
    getAllCoin();
  }

  final useCase = GetAllCoinsUseCase();

  List<Coin> getAllCoin() {
    state = useCase.getAllCoins();
    return state;
  }
}

final coinController = StateNotifierProvider<CoinController, List<Coin>>(
  (ref) => CoinController(),
);
