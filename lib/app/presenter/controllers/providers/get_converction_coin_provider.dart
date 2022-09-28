import 'package:decimal/decimal.dart';
import 'package:everest_crypto/app/data/repositories/coin_converction_repository_imp.dart';
import 'package:everest_crypto/app/domain/usecases/get_converction_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/datasources/api/endpoint_provider.dart';
import '../../../data/repositories/wallet_repository_imp.dart';
import '../../../domain/entities/coins_view_data.dart';
import '../../../domain/usecases/get_wallet_usecase.dart';

final vsCurrencyProvider = StateProvider<String>(
  (ref) => "brl",
);
final userCoinsProvider = StateProvider<Map<String, Decimal>>(
  (ref) => {
    'litecoin': Decimal.parse("1"),
    'usd-coin': Decimal.parse("103.04453215"),
    'avalanche-2': Decimal.parse("201.87444828"),
    'atom': Decimal.parse("198.69564269"),
    "bitcoin": Decimal.parse("2.65456841"),
    "ethereum": Decimal.parse("35.12598354"),
    "chiliz": Decimal.parse("121.95456874"),
  },
);

final repositoryProvider = Provider((ref) {
  return CoinConverctionRepositoryImp(ref.watch(genckoEndpointProvider));
});

final usecaseProvider = Provider(
  (ref) {
    return GetConverctionUsecaseImp(ref.watch(repositoryProvider));
  },
);

final converctionCoinProvider = FutureProvider<CoinViewData>(
  (ref) async {
    final result = await ref
        .read(usecaseProvider)
        .getConverction(coinId: "bitcoin", vsCurrency: "usdc");
    return result[0];
  },
);
