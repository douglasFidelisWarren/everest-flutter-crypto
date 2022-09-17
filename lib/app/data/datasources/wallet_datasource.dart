import 'package:decimal/decimal.dart';
import 'package:everest_crypto/app/data/dtos/coin_dto.dart';
import 'package:everest_crypto/app/domain/entities/coin_entity.dart';

class WalletDatasource {
  List<CoinDto> getCoinsWallet() {
    List<CoinDto> coins = [
      CoinDto(
        id: "1",
        image: "assets/images/btc.png",
        name: "Biticoin",
        symbol: "BTC",
        latest: Decimal.parse("100870.6923"),
        amount: Decimal.parse(".65"),
      ),
      CoinDto(
        id: "2",
        image: "assets/images/eth.png",
        name: "Ethereum",
        symbol: "ETH",
        latest: Decimal.parse("8506.38298"),
        amount: Decimal.parse("0.94"),
      ),
      CoinDto(
        id: "3",
        image: "assets/images/ltc.png",
        name: "Litecoin",
        symbol: "LTC",
        latest: Decimal.parse("298.780488"),
        amount: Decimal.parse("0.82"),
      ),
      CoinDto(
        id: "4",
        image: "assets/images/usdc.png",
        name: "USD Coin",
        symbol: "USDC",
        latest: Decimal.parse("5.094000000000001"),
        amount: Decimal.parse("350.0"),
      ),
      CoinDto(
        id: "5",
        image: "assets/images/avax.png",
        name: "Avalanche",
        symbol: "AVAX",
        latest: Decimal.parse("108.40032000000002128"),
        amount: Decimal.parse("3.5"),
      ),
      CoinDto(
        id: "6",
        image: "assets/images/atom.png",
        name: "Cosmos",
        symbol: "ATOM",
        latest: Decimal.parse("78.697206000000015449"),
        amount: Decimal.parse("1320.0"),
      ),
    ];
    return coins;
  }

  double getWallet() {
    Decimal wallet = Decimal.parse("0");
    List<CoinEntity> coinList = getCoinsWallet();

    for (var coin in coinList) {
      wallet = wallet + (coin.amount) * (coin.latest);
    }

    return wallet.toDouble();
  }
}
