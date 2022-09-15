import 'package:decimal/decimal.dart';
import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';

import '../model/coin.dart';

class CoinRepository {
  Dio dio;
  CoinRepository(this.dio);

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
        amount: ".65",
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

  Future<List<dynamic>> getPrices() async {
    List<dynamic> list = [];

    final response = await dio.get(
      'https://api.coinbase.com/v2/assets/prices/5b71fc48-3dd3-540c-809b-f8c94d0e68b5?base=BRL',
    );

    list = response.data['data']['prices']['week']['prices'];

    return list;
  }

  Future<double> getMax(int range) async {
    List<dynamic> data = await getPrices();
    double max = 0;

    for (var price in data) {
      if (price[0] > max) {
        max = price[0];
      }
    }

    return max;
  }

  Future<double> getMin(int range) async {
    List<dynamic> data = await getPrices();
    double min = await getMax(range);

    for (var price in data) {
      if (price[0] < min) {
        min = price[0];
      }
    }

    return min;
  }

  Future<List<FlSpot>> getSpots(int range) async {
    List<dynamic> data = await getPrices();
    List<dynamic> prices = [];
    List<FlSpot> spots = [];
    debugPrint("primeiro ${data.first[0]}");

    int index = 0;
    for (var i = 0; i < 30; i++) {
      index += range;
      prices.add(data[index]);
      String valor = Decimal.parse(prices[i][0]).toStringAsFixed(2);

      spots.add(
        FlSpot(i.toDouble(), (double.parse(valor))),
      );
      debugPrint("${i.toString()}, ${double.parse(valor)}");
      debugPrint("index $index");
    }
    //precos.add(moeda['hour']);
    // precos.add(moeda['day']);
    // precos.add(moeda['week']);
    // precos.add(moeda['month']);
    // precos.add(moeda['year']);
    // precos.add(moeda['all']);

    return spots;
  }

  Future<List<FlSpot>> getHistoricoMoeda(int range) async {
    final dio = Dio();
    final response = await dio.get(
      'https://api.coinbase.com/v2/assets/prices/5b71fc48-3dd3-540c-809b-f8c94d0e68b5?base=BRL',
    );
    List<dynamic> precos = [];
    List<FlSpot> spots = [];

    final list = response.data;
    //final Map<String, dynamic> moeda = list['data']['prices']['day']['prices'];
    List<dynamic> rs = list['data']['prices']['week']['prices'];
    int index = 0;
    for (var i = 0; i < 30; i++) {
      index += range;
      precos.add(rs[index]);
      String valor = Decimal.parse(precos[i][0]).toStringAsFixed(2);

      spots.add(
        FlSpot(i.toDouble(), (double.parse(valor))),
      );
      debugPrint("${i.toString()}, ${double.parse(valor)}");
      debugPrint("index $index");
    }
    //precos.add(moeda['hour']);
    // precos.add(moeda['day']);
    // precos.add(moeda['week']);
    // precos.add(moeda['month']);
    // precos.add(moeda['year']);
    // precos.add(moeda['all']);

    return spots;
  }
}
