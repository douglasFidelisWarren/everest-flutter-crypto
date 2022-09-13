import 'package:decimal/decimal.dart';

import '../models/coin.dart';

class CoinRepository {
  double getWallet() {
    Decimal wallet = Decimal.parse("0");
    List<Coin> coinList = getAllCoins();

    for (var coin in coinList) {
      wallet =
          wallet + (Decimal.parse(coin.amount) * Decimal.parse(coin.latest));
    }

    return wallet.toDouble();
  }

  Coin getCoinById(int id) {
    List<Coin> coinList = getAllCoins();
    Coin coin = coinList[id];
    return coin;
  }

  List<Coin> getAllCoins() {
    List<Coin> coins = [
      Coin(
        image: "assets/images/btc.png",
        name: "Biticoin",
        symbol: "BTC",
        latest: "10087.6923",
        amount: "0.65",
      ),
      Coin(
        image: "assets/images/eth.png",
        name: "Ethereum",
        symbol: "ETH",
        latest: "8506.38298",
        amount: "0.94",
      ),
      Coin(
        image: "assets/images/ltc.png",
        name: "Litecoin",
        symbol: "LTC",
        latest: "298.780488",
        amount: "0.82",
      ),
      Coin(
        image: "assets/images/usdc.png",
        name: "USD Coin",
        symbol: "USDC",
        latest: "5.094000000000001",
        amount: "350.0",
      ),
      Coin(
        image: "assets/images/avax.png",
        name: "Avalanche",
        symbol: "AVAX",
        latest: "108.40032000000002128",
        amount: "3.5",
      ),
      Coin(
        image: "assets/images/atom.png",
        name: "Cosmos",
        symbol: "ATOM",
        latest: "78.697206000000015449",
        amount: "1320.0",
      ),
    ];

    return coins;
  }
}
