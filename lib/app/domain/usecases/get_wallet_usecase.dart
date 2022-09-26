import 'package:decimal/decimal.dart';

import '../../data/models/coin_mapper.dart';
import '../entities/coins_view_data.dart';
import '../repositories/iwallet_repository.dart';

abstract class IGetWalletUsecase {
  Future<List<CoinViewData>> getCoinsWallet(
      Map<String, Decimal> userCoin, String vsCurrency);
}

class GetWalletUsecaseImp implements IGetWalletUsecase {
  final IWalletRepository _repository;

  GetWalletUsecaseImp(this._repository);

  @override
  Future<List<CoinViewData>> getCoinsWallet(
      Map<String, Decimal> userCoin, String vsCurrency) async {
    final response = await _repository.getWallet(userCoin, vsCurrency);
    List<CoinViewData> coins = response.toViewData();
    List<CoinViewData> coinsWithAmount = [];
    for (var coin in coins) {
      final amountVsCurrency =
          Decimal.parse(userCoin[coin.id].toString()) * coin.currentPrice;
      coinsWithAmount.add(CoinViewData(
          Decimal.parse(userCoin[coin.id].toString()), amountVsCurrency,
          id: coin.id,
          name: coin.name,
          symbol: coin.symbol,
          image: coin.image,
          currentPrice: coin.currentPrice,
          percentage24h: coin.percentage24h));
    }
    return coinsWithAmount;
  }
}