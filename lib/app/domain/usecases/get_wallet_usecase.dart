import 'package:decimal/decimal.dart';
import 'package:everest_crypto/app/data/dtos/coin_mapper.dart';
import 'package:everest_crypto/app/domain/repositories/wallet_repository.dart';

import '../entities/coins_view_data.dart';

abstract class IGetWalletUsecase {
  Future<List<CoinViewData>> getWallet(
      Map<String, Decimal> userCoin, String vsCurrency);
}

class GetWalletUsecaseImp implements IGetWalletUsecase {
  final IWalletRepository _repository;

  GetWalletUsecaseImp(this._repository);

  @override
  Future<List<CoinViewData>> getWallet(
      Map<String, Decimal> userCoin, String vsCurrency) async {
    final response = await _repository.getWallet(userCoin, vsCurrency);

    return response.toViewData();
  }
}
