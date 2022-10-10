import 'package:decimal/decimal.dart';

import '../../data/models/coin_mapper.dart';
import '../entities/coins_view_data.dart';
import '../repositories/i_wallet_repository.dart';

abstract class IGetWalletUsecase {
  Future<List<CoinViewData>> getCoinsWallet(
      //Map<String, Decimal> userCoin, String vsCurrency
      );
}

class GetWalletUsecaseImp implements IGetWalletUsecase {
  final IWalletRepository _repository;

  GetWalletUsecaseImp(this._repository);

  @override
  Future<List<CoinViewData>> getCoinsWallet(
      // Map<String, Decimal> userCoin, String vsCurrency
      ) async {
    final response = await _repository.getCoinsWallet(
        //userCoin, vsCurrency
        );
    Map<String, double> userCoin = {
      'litecoin': 0.1,
      'usd-coin': 103.04453215,
      'avalanche-2': 201.87444828,
      'atom': 198.69564269,
      "bitcoin": 5.65456841,
      "ethereum": 35.12598354,
      "chiliz": 121.95456874,
    };
    List<CoinViewData> coins = response.toViewData();
    List<CoinViewData> coinsWithAmount = [];
    for (var coin in coins) {
      Decimal amountVsCurrency = Decimal.parse(userCoin[coin.id].toString()) *
          Decimal.parse(coin.currentPrice.toString());
      coinsWithAmount.add(CoinViewData(
          amount: userCoin[coin.id],
          amountVsCurrency: double.parse(amountVsCurrency.toString()),
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
