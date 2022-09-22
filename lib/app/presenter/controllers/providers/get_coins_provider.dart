// import 'package:dio/dio.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../../data/datasources/api/get_coins_endpoint.dart';
// import '../../../data/datasources/api/models/get_all_coins_response.dart';
// import '../../../data/repositories/coin_repository_imp.dart';
// import '../../../domain/usecases/coin_usecase.dart';
// import '../notifiers/get_coins_notifier.dart';

// final coinDatasourceProvider = Provider((ref) {
//   return GetCoinsEndpoint(Dio());
// });

// final coinRepositoryProvider = Provider((ref) {
//   return GetCoinsRepositoryImp(
//     getCoinsEndpoint: ref.watch(coinDatasourceProvider),
//   );
// });

// final coinUsecaseProvider = Provider((ref) {
//   return GetCoinsUsecaseImp(ref.watch(coinRepositoryProvider));
// });

// //get2
// final coinsNotifierProviderTeste =
//     StateNotifierProvider<GetCoinsNotifier, Future<List<GetCoinsResponse>>>(
//         (ref) {
//   return GetCoinsNotifier(ref.watch(coinUsecaseProvider));

// });
import 'package:dio/dio.dart';
import 'package:everest_crypto/app/data/repositories/coin_repository_imp.dart';
import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:everest_crypto/app/domain/usecases/coin_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/datasources/api/get_coins_endpoint.dart';
import '../notifiers/get_coins_notifier.dart';

final getCoinsEndpointProvider = Provider((ref) {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.coingecko.com/api/v3',
  ));
  return GetCoinsEndpoint(dio);
});

final coinRepositoryProvider = Provider((ref) {
  return CoinRepositoryImp(
      getCoinsEndpoint: ref.watch(getCoinsEndpointProvider));
});

final coinUsecaseProvider = Provider(
  (ref) {
    return GetCoinsUsecaseImp(ref.read(coinRepositoryProvider));
  },
);

final coinsNotifierProviderTeste =
    StateNotifierProvider<GetCoinsNotifier, AsyncValue<List<CoinViewData>>>(
        (ref) {
  return GetCoinsNotifier(ref.watch(coinUsecaseProvider));
});
