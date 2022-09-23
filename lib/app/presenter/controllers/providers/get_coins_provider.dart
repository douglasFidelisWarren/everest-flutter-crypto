import 'package:everest_crypto/app/data/repositories/coin_repository_imp.dart';
import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:everest_crypto/app/domain/usecases/coin_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/datasources/api/endpoint_provider.dart';

final vsCurrencyProvider = StateProvider<String>(
  (ref) => "brl",
);

final coinRepositoryProvider = Provider((ref) {
  return CoinRepositoryImp(genkcoEndpoint: ref.watch(getCoinsEndpointProvider));
});

final coinUsecaseProvider = Provider(
  (ref) {
    return GetCoinsUsecaseImp(ref.read(coinRepositoryProvider));
  },
);

final coinsNotifierProvider = FutureProvider<List<CoinViewData>>(
  (ref) async {
    return ref
        .read(coinUsecaseProvider)
        .getAllCoins(ref.read(vsCurrencyProvider));
  },
);
