import 'package:decimal/decimal.dart';
import 'package:dio/dio.dart';
import 'package:everest_crypto/app/data/datasources/api/models/prices_response.dart';
import 'package:everest_crypto/app/domain/entities/prices_view_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/datasources/api/endpoint_provider.dart';
import '../../../data/repositories/coin_prices_repository_imp.dart';
import '../../../domain/usecases/get_coin_prices_usecase.dart';
import '../notifiers/coin_prices_notifier.dart';

final priceParameters = StateProvider<PricesResponse>(
  (ref) => PricesResponse(
      prices: Decimal.parse("0"),
      marketcaps: Decimal.parse("0"),
      totalvolumes: Decimal.parse("0")),
);

final coinPricesRepositoryProvider = Provider((ref) {
  return CoinPricesRepositoryImp(ref.watch(getCoinsEndpointProvider));
});

final coinPricesUsecaseProvider = Provider((ref) {
  return GetCoinPricesUsecaseImp(ref.watch(coinPricesRepositoryProvider));
});

// final coinsNotifierProvider =
//     StateNotifierProvider<GetCoinsNotifier, AsyncValue<List<GetCoinsResponse>>>(
//         (ref) {
//   return GetCoinsNotifier(ref.watch(coinUsecaseProvider));
// });

final coinPricesNotifierProvider =
    StateNotifierProvider<CoinPricesNotifier, AsyncValue<List<Decimal>>>((ref) {
  return CoinPricesNotifier(ref.watch(coinPricesUsecaseProvider));
});
