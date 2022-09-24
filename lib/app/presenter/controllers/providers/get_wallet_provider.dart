import 'package:decimal/decimal.dart';
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
    'litecoin': Decimal.parse("253.58"),
    'usd-coin': Decimal.parse("103.04"),
    'avalanche-2': Decimal.parse("201.18"),
    'atom': Decimal.parse("198.69"),
    "bitcoin": Decimal.parse("2.65"),
    "ethereum": Decimal.parse("35"),
    "cosmos": Decimal.parse("121.5"),
  },
);

final walletRepositoryProvider = Provider((ref) {
  return WalletRepositoryImp(ref.watch(genckoEndpointProvider));
});

final walletUsecaseProvider = Provider(
  (ref) {
    return GetWalletUsecaseImp(ref.read(walletRepositoryProvider));
  },
);

final walletNotifierProvider = FutureProvider<List<CoinViewData>>(
  (ref) async {
    return ref
        .read(walletUsecaseProvider)
        .getWallet(ref.read(userCoinsProvider), ref.read(vsCurrencyProvider));
  },
);
