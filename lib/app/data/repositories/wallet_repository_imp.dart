import 'package:decimal/decimal.dart';
import 'package:everest_crypto/app/data/datasources/api/models/get_all_coins_response.dart';
import 'package:everest_crypto/app/domain/repositories/wallet_repository.dart';

import '../datasources/api/endpoints/gencko_endpoints.dart';
import '../datasources/api/models/coin_response.dart';

class WalletRepositoryImp implements IWalletRepository {
  final GenckoEndpoints genkcoEndpoint;

  WalletRepositoryImp(
    this.genkcoEndpoint,
  );

  @override
  Future<GetAllCoinsResponse> getWallet(
      Map<String, Decimal> userCoin, String vsCurrency) async {
    final result = await genkcoEndpoint.getCoinsWallet(userCoin, vsCurrency);

    return GetAllCoinsResponse(
        List.from(result.data.map((coin) => CoinResponse.fromJson(coin))));
  }
}
