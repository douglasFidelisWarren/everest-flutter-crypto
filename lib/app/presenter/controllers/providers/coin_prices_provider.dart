import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/datasources/api/endpoint_provider.dart';
import '../../../data/repositories/coin_prices_repository_imp.dart';
import '../../../domain/usecases/get_coin_prices_usecase.dart';
import '../notifiers/get_coin_prices_notifier.dart';

final coinPricesRepositoryProvider = Provider((ref) {
  return CoinPricesRepositoryImp(ref.watch(genckoEndpointProvider));
});

final coinPricesUsecaseProvider = Provider((ref) {
  return GetCoinPricesUsecaseImp(ref.watch(coinPricesRepositoryProvider));
});

final coinPricesNotifierProvider =
    StateNotifierProvider<CoinPricesNotifier, AsyncValue<List<Decimal>>>((ref) {
  return CoinPricesNotifier(ref.watch(coinPricesUsecaseProvider));
});
