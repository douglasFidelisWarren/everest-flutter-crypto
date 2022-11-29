import 'package:decimal/decimal.dart';
import 'package:everest_crypto/app/data/datasources/api/endpoints/gencko_endpoints.dart';
import 'package:everest_crypto/app/data/repositories/coin_prices_repository_imp.dart';
import 'package:everest_crypto/app/domain/entities/chart_config_entity.dart';
import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:everest_crypto/app/domain/entities/exchange_entity.dart';
import 'package:everest_crypto/app/domain/repositories/i_coin_prices_repository.dart';
import 'package:faker/faker.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FakeRepo implements ICoinPricesRepository {
  List<CoinViewData> dropList() {
    return [
      CoinViewData(
        currentPrice: Decimal.parse("1"),
        id: "1",
        image: faker.internet.httpUrl(),
        name: "bitcoin",
        percentage24h: faker.randomGenerator.decimal(),
        symbol: "btc",
        amount: Decimal.parse(faker.randomGenerator.decimal().toString()),
        amountVsCurrency:
            Decimal.parse(faker.randomGenerator.decimal().toString()),
      ),
      CoinViewData(
        currentPrice: Decimal.parse("1"),
        id: "2",
        image: faker.internet.httpUrl(),
        name: "ethereum",
        percentage24h: faker.randomGenerator.decimal(),
        symbol: "eth",
        amount: Decimal.parse(faker.randomGenerator.decimal().toString()),
        amountVsCurrency:
            Decimal.parse(faker.randomGenerator.decimal().toString()),
      ),
    ];
  }

  CoinViewData getCoin() {
    CoinViewData coin = CoinViewData(
      currentPrice: Decimal.parse("1"),
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
        id: "bitcoin",
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
        id: "ethereum",
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

  ExchangeViewData getExchange() {
    CoinViewData fromCoin = getCoin();
    CoinViewData toCoin = getCoin();
    Decimal amtConvert = Decimal.parse("1");
    double valor =
        fromCoin.currentPrice.toDouble() / toCoin.currentPrice.toDouble();
    double amtReceive =
        (amtConvert.toDouble() * fromCoin.currentPrice.toDouble()) /
            toCoin.currentPrice.toDouble();

    ExchangeViewData exchange = ExchangeViewData(
      fromCoin: fromCoin,
      toCoin: toCoin,
      amtConvert: amtConvert,
      amtReceive: Decimal.parse(amtReceive.toString()),
      date: DateTime.now(),
      valueExchange: Decimal.parse(valor.toString()),
    );
    return exchange;
  }

  List<ExchangeViewData> getExchangeList() {
    List<ExchangeViewData> exchangeList = [];
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

  @override
  Future<List<Decimal>> getCoinPrices(
      String coinId, String vScurrency, int days) async {
    return getPrices();
  }
}

class CoinPricesRepositoryFake implements CoinPricesRepositoryImp {
  @override
  GenckoEndpoints get genkcoEndpoint => throw UnimplementedError();

  @override
  Future<List<Decimal>> getCoinPrices(
      String coinId, String vScurrency, int days) async {
    return [Decimal.parse("1")];
  }
}

FakeRepo repo = FakeRepo();

final getAllcoinsNotifierProviderFake = FutureProvider<List<CoinViewData>>(
  (ref) async {
    return repo.getCoinList();
  },
);

final coinsWalletProviderFake = FutureProvider<List<CoinViewData>>(
  (ref) async {
    return repo.getCoinList();
  },
);

final pageControllerProviderFake = StateProvider<PageController>(
  (ref) => PageController(initialPage: 0),
);
