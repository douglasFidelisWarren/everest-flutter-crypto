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
        latest: "100870.6923",
        amount: ".65",
        percentChange: 0.19,
      ),
      CoinDto(
        id: "2",
        image: "assets/images/eth.png",
        name: "Ethereum",
        symbol: "ETH",
        latest: "8506.38298",
        amount: "0.94",
        percentChange: -2.01,
      ),
      CoinDto(
        id: "3",
        image: "assets/images/ltc.png",
        name: "Litecoin",
        symbol: "LTC",
        latest: "298.780488",
        amount: "0.82",
        percentChange: -0.12,
      ),
      CoinDto(
        id: "4",
        image: "assets/images/usdc.png",
        name: "USD Coin",
        symbol: "USDC",
        latest: "5.094000000000001",
        amount: "350.0",
        percentChange: 0.00,
      ),
      CoinDto(
        id: "5",
        image: "assets/images/avax.png",
        name: "Avalanche",
        symbol: "AVAX",
        latest: "108.40032000000002128",
        amount: "3.5",
        percentChange: -0.01,
      ),
      CoinDto(
        id: "6",
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
