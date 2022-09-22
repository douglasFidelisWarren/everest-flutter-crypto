// import 'package:decimal/decimal.dart';
// import 'package:dio/dio.dart';

// import '../get_coin_prices_datasource.dart';
// import 'endpoints/coinbase.dart';

// class GetCoinPricesRemoteDatasourceImp implements GetCoinPricesDatasource {
//   final Dio _dio;
//   GetCoinPricesRemoteDatasourceImp(this._dio);

//   @override
//   Future<List<Decimal>> getCoinPrices(
//       String coinId, String vScurrency, int fromTime, int toTime) async {
//     List<dynamic> list = [];
//     List<Decimal> prices = [];

//     final response = await _dio.get(Coinbase.getCoinPrices(coinId.toString()));
//     list = response.data['data']['prices'][period]['prices'];
//     for (var list in list) {
//       prices.add(Decimal.parse(list[0].toString()));
//     }
//     prices = prices.reversed.toList();
//     return prices;
//   }
// }
