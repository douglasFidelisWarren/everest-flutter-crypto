// import 'package:decimal/decimal.dart';
// import 'package:dio/dio.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/cupertino.dart';

// import '../model/coin.dart';

// class CoinRepository {
//   Dio dio;
//   CoinRepository(this.dio);

//   

//   Coin getCoinById(int id) {
//     List<Coin> coinList = getAllCoins();
//     Coin coin = coinList[id];
//     return coin;
//   }

//   

//   F

//   Future<double> getMax(int range) async {
//     List<dynamic> data = await getPrices();
//     double max = 0;

//     for (var price in data) {
//       if (price[0] > max) {
//         max = price[0];
//       }
//     }

//     return max;
//   }

//   Future<double> getMin(int range) async {
//     List<dynamic> data = await getPrices();
//     double min = await getMax(range);

//     for (var price in data) {
//       if (price[0] < min) {
//         min = price[0];
//       }
//     }

//     return min;
//   }



//   Future<List<FlSpot>> getSpots1(int range) async {
//     List<dynamic> data = await getPrices();
//     List<dynamic> prices = [];
//     List<FlSpot> spots = [];
//     debugPrint("primeiro ${data.first[0]}");

//     int index = 0;
//     for (var i = 0; i < 30; i++) {
//       index += range;
//       prices.add(data[index]);
//       String valor = Decimal.parse(prices[i][0]).toStringAsFixed(2);

//       spots.add(
//         FlSpot(i.toDouble(), (double.parse(valor))),
//       );
//       debugPrint("${i.toString()}, ${double.parse(valor)}");
//       debugPrint("index $index");
//     }

//     //precos.add(moeda['hour']);
//     // precos.add(moeda['day']);
//     // precos.add(moeda['week']);
//     // precos.add(moeda['month']);
//     // precos.add(moeda['year']);
//     // precos.add(moeda['all']);

//     return spots;
//   }

//   Future<List<FlSpot>> getHistoricoMoeda(int range) async {
//     final dio = Dio();
//     final response = await dio.get(
//       'https://api.coinbase.com/v2/assets/prices/5b71fc48-3dd3-540c-809b-f8c94d0e68b5?base=BRL',
//     );
//     List<dynamic> precos = [];
//     List<FlSpot> spots = [];

//     final list = response.data;
//     //final Map<String, dynamic> moeda = list['data']['prices']['day']['prices'];
//     List<dynamic> rs = list['data']['prices']['week']['prices'];
//     int index = 0;
//     for (var i = 0; i < 30; i++) {
//       index += range;
//       precos.add(rs[index]);
//       String valor = Decimal.parse(precos[i][0]).toStringAsFixed(2);

//       spots.add(
//         FlSpot(i.toDouble(), (double.parse(valor))),
//       );
//       debugPrint("${i.toString()}, ${double.parse(valor)}");
//       debugPrint("index $index");
//     }
//     //precos.add(moeda['hour']);
//     // precos.add(moeda['day']);
//     // precos.add(moeda['week']);
//     // precos.add(moeda['month']);
//     // precos.add(moeda['year']);
//     // precos.add(moeda['all']);

//     return spots;
//   }
// }
