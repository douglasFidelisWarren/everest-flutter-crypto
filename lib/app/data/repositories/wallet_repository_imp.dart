import 'package:decimal/decimal.dart';

import '../../domain/repositories/i_wallet_repository.dart';
import '../datasources/api/endpoints/gencko_endpoints.dart';
import '../models/coin_response.dart';
import '../models/get_all_coins_response.dart';

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
