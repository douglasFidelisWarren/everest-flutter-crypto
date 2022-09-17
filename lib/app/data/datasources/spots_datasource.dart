import 'package:decimal/decimal.dart';
import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SpotsDatasource {
  Dio dio = Dio();

  Future<double> getMaxX() async {
    List<Decimal> data = await getPrices();
    double max = 0;
    for (var price in data) {
      if (double.parse(price.toString()) > max) {
        max = double.parse(price.toString());
      }
    }
    return max;
  }

  Future<double> getMinX() async {
    List<dynamic> data = await getPrices();
    double min = await getMaxX();

    for (var price in data) {
      if (double.parse(price.toString()) < min) {
        min = double.parse(price.toString());
      }
    }
    return min;
  }

  Future<List<Decimal>> getPrices() async {
    List<dynamic> list = [];
    List<Decimal> prices = [];

    final response = await dio.get(
      'https://api.coinbase.com/v2/assets/prices/5b71fc48-3dd3-540c-809b-f8c94d0e68b5?base=BRL',
    );
    print("getspots");

    list = response.data['data']['prices']['week']['prices'];
    for (var list in list) {
      prices.add(Decimal.parse(list[0].toString()));
    }
    prices = prices.reversed.toList();
    return prices;
  }

  Future<List<FlSpot>> getSpots(int range) async {
    List<Decimal> data = await getPrices();
    List<dynamic> prices = [];
    List<FlSpot> spots = [];

    for (var i = 0; i < data.length; i++) {
      prices.add(data[i]);
      String valor = double.parse(prices[i].toString()).toStringAsFixed(2);
      spots.add(
        FlSpot(i.toDouble(), (double.parse(valor))),
      );
    }

    return spots;
  }
}