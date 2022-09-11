import 'coin.dart';

class CoinRepository {
  List<Coin> getCoins() {
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
    ];

    return coins;
  }
}
