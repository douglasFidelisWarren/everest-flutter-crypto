import 'package:decimal/decimal.dart';

import '../../domain/entities/coin_entity.dart';
import '../dtos/coin_dto.dart';

class WalletDatasource {
  List<CoinDto> getCoinsWallet() {
    List<CoinDto> coins = [
      CoinDto(
        id: "bitcoin",
        image: "assets/images/btc.png",
        name: "Bitcoin",
        symbol: "BTC",
        latest: "100870.6923",
        amount: ".65",
        percentChange: 0.19,
      ),
      CoinDto(
        id: "ethereum",
        image: "assets/images/eth.png",
        name: "Ethereum",
        symbol: "ETH",
        latest: "8506.38298",
        amount: "0.94",
        percentChange: -2.01,
      ),
      CoinDto(
        id: "c9c24c6e-c045-5fde-98a2-00ea7f520437",
        image: "assets/images/ltc.png",
        name: "Litecoin",
        symbol: "LTC",
        latest: "298.780488",
        amount: "0.82",
        percentChange: -0.12,
      ),
      CoinDto(
        id: "2b92315d-eab7-5bef-84fa-089a131333f5",
        image: "assets/images/usdc.png",
        name: "USD Coin",
        symbol: "USDC",
        latest: "5.094000000000001",
        amount: "350.0",
        percentChange: 0.00,
      ),
      CoinDto(
        id: "9d06e463-b3ba-5abf-9082-8761846b28ab",
        image: "assets/images/avax.png",
        name: "Avalanche",
        symbol: "AVAX",
        latest: "108.40032000000002128",
        amount: "3.5",
        percentChange: -0.01,
      ),
      CoinDto(
        id: "64c607d2-4663-5649-86e0-3ab06bba0202",
        image: "assets/images/atom.png",
        name: "Cosmos",
        symbol: "ATOM",
        latest: "78.697206000000015449",
        amount: "1320.0",
        percentChange: 0.05,
      ),
    ];
    return coins;
  }

  double getWallet() {
    Decimal wallet = Decimal.parse("0");
    List<CoinEntity> coinList = getCoinsWallet();

    for (var coin in coinList) {
      wallet =
          wallet + (Decimal.parse(coin.amount)) * (Decimal.parse(coin.latest));
    }
    return wallet.toDouble();
  }
}
