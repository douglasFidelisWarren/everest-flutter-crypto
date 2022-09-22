import 'package:decimal/decimal.dart';
import 'package:dio/dio.dart';
import 'package:everest_crypto/app/data/datasources/api/models/prices_response.dart';
import 'package:everest_crypto/app/domain/entities/prices_view_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/datasources/api/endpoint_provider.dart';
import '../../../data/repositories/coin_prices_repository_imp.dart';
import '../../../domain/usecases/get_coin_prices_usecase.dart';

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

final coinPricesNotifierProvider = FutureProvider<List<Decimal>>((ref) async {
  return ref
      .read(coinPricesUsecaseProvider)
      .getCoinPrices("bitcoin", "brl", 1663718400, 1663804800);
});
