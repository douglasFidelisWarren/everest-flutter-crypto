import 'package:decimal/decimal.dart';

import '../../data/datasources/api/models/get_all_coins_response.dart';

abstract class IWalletRepository {
  Future<GetAllCoinsResponse> getWallet(
      Map<String, Decimal> userCoin, String vsCurrency);
}
