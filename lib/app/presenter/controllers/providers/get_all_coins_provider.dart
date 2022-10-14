import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/datasources/api/endpoint_provider.dart';
import '../../../data/repositories/coin_repository_imp.dart';
import '../../../domain/entities/coins_view_data.dart';
import '../../../domain/usecases/get_all_coins_usecase.dart';

final vsCurrencyProvider = StateProvider<String>(
  (ref) => "brl",
);

final coinRepositoryProvider = Provider((ref) {
  return CoinRepositoryImp(genckoEndpoint: ref.watch(genckoEndpointProvider));
});

final coinUsecaseProvider = Provider(
  (ref) {
    return GetAllCoinsUsecaseImp(ref.read(coinRepositoryProvider));
  },
);

final getAllcoinsNotifierProvider = FutureProvider<List<CoinViewData>>(
  (ref) async {
    return ref
        .read(coinUsecaseProvider)
        .getAllCoins(ref.read(vsCurrencyProvider));
  },
);
