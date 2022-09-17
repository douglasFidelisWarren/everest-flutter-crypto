import 'package:decimal/decimal.dart';
import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SpotsDatasource {
  Dio dio = Dio();

  Future<List<String>> getPrices() async {
    List<dynamic> list = [];
    List<String> prices = [];

    final response = await dio.get(
      'https://api.coinbase.com/v2/assets/prices/5b71fc48-3dd3-540c-809b-f8c94d0e68b5?base=BRL',
    );
    print("getspots");

    list = response.data['data']['prices']['day']['prices'];
    for (var list in list) {
      prices.add(list[0]);
    }
    prices = prices.reversed.toList();
    return prices;
  }

  Future<List<FlSpot>> getSpots(int range) async {
    List<String> data = await getPrices();
    List<dynamic> prices = [];
    List<FlSpot> spots = [];
    debugPrint("primeiro ${data.first}");

    //int index = 0;
    for (var i = 0; i < data.length; i++) {
      //index += range;
      prices.add(data[i]);
      double valor = double.parse(prices[i]);

      spots.add(
        FlSpot(i.toDouble(), (valor)),
      );
      debugPrint("${i.toString()}, ${valor}");
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
