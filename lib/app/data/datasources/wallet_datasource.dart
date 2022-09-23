import 'package:decimal/decimal.dart';

import '../../domain/entities/coin_entity.dart';
import '../../domain/entities/coins_view_data.dart';
import '../dtos/coin_dto.dart';

class WalletDatasource {
  List<CoinViewData> getCoinsWallet() {
    List<CoinViewData> coins = [
      CoinViewData(
        id: "bitcoin",
        image: "assets/images/btc.png",
        name: "Bitcoin",
        symbol: "BTC",
        currentPrice: Decimal.parse("100870.6923"),
        percentage24h: 0.19,
      ),
      CoinViewData(
        id: "ethereum",
        image: "assets/images/eth.png",
        name: "Ethereum",
        symbol: "ETH",
        currentPrice: Decimal.parse("8506.38298"),
        percentage24h: -2.01,
      ),
      CoinViewData(
        id: "c9c24c6e-c045-5fde-98a2-00ea7f520437",
        image: "assets/images/ltc.png",
        name: "Litecoin",
        symbol: "LTC",
        currentPrice: Decimal.parse("298.780488"),
        percentage24h: -0.12,
      ),
      CoinViewData(
        id: "2b92315d-eab7-5bef-84fa-089a131333f5",
        image: "assets/images/usdc.png",
        name: "USD Coin",
        symbol: "USDC",
        currentPrice: Decimal.parse("5.094000000000001"),
        percentage24h: 0.00,
      ),
      CoinViewData(
        id: "9d06e463-b3ba-5abf-9082-8761846b28ab",
        image: "assets/images/avax.png",
        name: "Avalanche",
        symbol: "AVAX",
        currentPrice: Decimal.parse("108.40032000000002128"),
        percentage24h: -0.01,
      ),
      CoinViewData(
        id: "64c607d2-4663-5649-86e0-3ab06bba0202",
        image: "assets/images/atom.png",
        name: "Cosmos",
        symbol: "ATOM",
        currentPrice: Decimal.parse("78.697206000000015449"),
        percentage24h: 0.05,
      ),
    ];
    return coins;
  }

  double getWallet() {
    Decimal wallet = Decimal.parse("0");
    List<CoinViewData> coinList = getCoinsWallet();

    for (var coin in coinList) {
      wallet = wallet + (Decimal.parse("3") * coin.currentPrice);
    }
    return wallet.toDouble();
  }
}
