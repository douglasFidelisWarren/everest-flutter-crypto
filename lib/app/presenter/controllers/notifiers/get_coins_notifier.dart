import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entities/coins_view_data.dart';
import '../../../domain/usecases/coin_usecase.dart';

class GetCoinsNotifier extends StateNotifier<AsyncValue<List<CoinViewData>>> {
  final ICoinUsecase _usecase;

  GetCoinsNotifier(this._usecase) : super(const AsyncData([]));

  Future<void> getAllCoins(String vsCurrent) async {
    state = const AsyncLoading();
    state = AsyncData(await _usecase.getAllCoins());
  }
}
