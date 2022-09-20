import 'package:decimal/decimal.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/datasources/remote_datasource/get_coin_prices_remote_datasource.dart';
import '../../../data/repositories/get_coin_prices_repository_imp.dart';
import '../../../domain/usecases/get_coin_prices_usecase.dart';
import '../notifiers/get_coin_prices_notifier.dart';

final dioProvider = Provider((ref) => Dio());

final coinPricesDatasourceProvider = Provider((ref) {
  return GetCoinPricesRemoteDatasourceImp(ref.watch(dioProvider));
});

final coinPricesRepositoryProvider = Provider((ref) {
  return GetCoinPricesRepositoryImp(ref.watch(coinPricesDatasourceProvider));
});

final coinPricesUsecaseProvider = Provider((ref) {
  return GetCoinPricesUsecaseImp(ref.watch(coinPricesRepositoryProvider));
});

final coinPricesNotifierProvider =
    StateNotifierProvider<GetCoinPricesNotifier, AsyncValue<List<Decimal>>>(
        (ref) {
  return GetCoinPricesNotifier(ref.watch(coinPricesUsecaseProvider));
});
