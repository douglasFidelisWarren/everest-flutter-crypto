import 'package:decimal/decimal.dart';
import 'package:everest_crypto/app/domain/entities/chart_config_entity.dart';
import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:everest_crypto/app/domain/entities/exchange_entity.dart';
import 'package:faker/faker.dart';
import 'package:fl_chart/fl_chart.dart';

class FakeRepo {
  CoinViewData getCoin() {
    CoinViewData coin = CoinViewData(
      currentPrice: Decimal.parse(faker.randomGenerator.decimal().toString()),
      id: faker.guid.toString(),
      image: faker.internet.httpUrl(),
      name: faker.lorem.word(),
      percentage24h: faker.randomGenerator.decimal(),
      symbol: faker.lorem.word(),
      amount: Decimal.parse(faker.randomGenerator.decimal().toString()),
      amountVsCurrency:
          Decimal.parse(faker.randomGenerator.decimal().toString()),
    );
    return coin;
  }

  List<CoinViewData> getCoinList() {
    List<CoinViewData> coinList = [
      CoinViewData(
        currentPrice: Decimal.parse(faker.randomGenerator.decimal().toString()),
        id: faker.guid.toString(),
        image: faker.internet.httpUrl(),
        name: faker.lorem.word(),
        percentage24h: faker.randomGenerator.decimal(),
        symbol: faker.lorem.word(),
        amount: Decimal.parse(faker.randomGenerator.decimal().toString()),
        amountVsCurrency:
            Decimal.parse(faker.randomGenerator.decimal().toString()),
      ),
      CoinViewData(
        currentPrice: Decimal.parse(faker.randomGenerator.decimal().toString()),
        id: faker.guid.toString(),
        image: faker.internet.httpUrl(),
        name: faker.lorem.word(),
        percentage24h: faker.randomGenerator.decimal(min: -10),
        symbol: faker.lorem.word(),
        amount: Decimal.parse(faker.randomGenerator.decimal().toString()),
        amountVsCurrency:
            Decimal.parse(faker.randomGenerator.decimal().toString()),
      )
    ];

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

  ChartConfigViewData getChartConfig() {
    return ChartConfigViewData(period: 1, percent: 1, max: 1, min: 1, spots: [
      const FlSpot(1, 2),
      const FlSpot(2, 3),
    ]);
  }

  List<Decimal> getPrices() {
    return [Decimal.parse("3"), Decimal.parse("1")];
  }
}
