import 'package:decimal/decimal.dart';
import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';

import 'remote_datasource/get_coin_prices_remote_datasource.dart';

class SpotsDatasource {
  Dio dio = Dio();

  Future<List<Decimal>> getPrices(String period) async {
    GetCoinPricesRemoteDatasourceImp teste =
        GetCoinPricesRemoteDatasourceImp(dio);
    List<Decimal> prices = [];
    return prices;
  }

  Future<List<FlSpot>> getSpots(String period) async {
    List<Decimal> data = await getPrices(period);
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
