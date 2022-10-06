import 'package:decimal/decimal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/datasources/api/endpoint_provider.dart';
import '../../../data/repositories/wallet_repository_imp.dart';
import '../../../domain/entities/coins_view_data.dart';
import '../../../domain/usecases/get_wallet_usecase.dart';

final vsCurrencyProvider = StateProvider<String>(
  (ref) => "brl",
);
final userCoinsProvider = StateProvider<Map<String, Decimal>>(
  (ref) => {
    'litecoin': Decimal.parse("0.1"),
    'usd-coin': Decimal.parse("103.04453215"),
    'avalanche-2': Decimal.parse("201.87444828"),
    'atom': Decimal.parse("198.69564269"),
    "bitcoin": Decimal.parse("2.65456841"),
    "ethereum": Decimal.parse("35.12598354"),
    "chiliz": Decimal.parse("121.95456874"),
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

final coinsWalletProvider = FutureProvider<List<CoinViewData>>(
  (ref) async {
    return ref.read(walletUsecaseProvider).getCoinsWallet(
        ref.read(userCoinsProvider), ref.read(vsCurrencyProvider));
  },
);
