import 'package:decimal/decimal.dart';
import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';

class FakeRepo {
  CoinViewData getCoin() {
    CoinViewData coin = CoinViewData(
        currentPrice: Decimal.parse("100"),
        id: "btc",
        image:
            "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
        name: "btc",
        percentage24h: 0,
        symbol: "btc",
        amount: Decimal.parse("2"),
        amountVsCurrency: Decimal.parse("3"));
    return coin;
  }
}
