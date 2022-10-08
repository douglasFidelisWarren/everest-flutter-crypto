import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:everest_crypto/app/domain/entities/exchange_entity.dart';

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

  List<CoinViewData> getCoinList() {
    List<CoinViewData> coinList = [];
    for (var i = 0; i < 3; i++) {
      coinList.add(getCoin());
    }
    return coinList;
  }

  ExchangeEntity getExchange() {
    CoinViewData fromCoin = getCoin();
    CoinViewData toCoin = getCoin();
    Decimal amtConvert = Decimal.parse("1");
    double valor =
        fromCoin.currentPrice.toDouble() / toCoin.currentPrice.toDouble();
    double amtReceive =
        (amtConvert.toDouble() * fromCoin.currentPrice.toDouble()) /
            toCoin.currentPrice.toDouble();

    ExchangeEntity exchange = ExchangeEntity(
      fromCoin: fromCoin,
      toCoin: toCoin,
      amtConvert: amtConvert,
      amtReceive: Decimal.parse(amtReceive.toString()),
      date: DateTime.now(),
      valueExchange: Decimal.parse(valor.toString()),
    );
    return exchange;
  }

  List<ExchangeEntity> getExchangeList() {
    List<ExchangeEntity> exchangeList = [];
    for (var i = 0; i < 3; i++) {
      exchangeList.add(getExchange());
    }
    return exchangeList;
  }
}
