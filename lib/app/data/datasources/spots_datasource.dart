import 'package:decimal/decimal.dart';
import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SpotsDatasource {
  Dio dio = Dio();
  Future<List<dynamic>> getPrices() async {
    List<dynamic> list = [];

    final response = await dio.get(
      'https://api.coinbase.com/v2/assets/prices/5b71fc48-3dd3-540c-809b-f8c94d0e68b5?base=BRL',
    );
    print("getspots");

    list = response.data['data']['prices']['week']['prices'];

    return list;
  }

  Future<List<FlSpot>> getSpots(int range) async {
    List<dynamic> data = await getPrices();
    data = data.reversed.toList();
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
}
