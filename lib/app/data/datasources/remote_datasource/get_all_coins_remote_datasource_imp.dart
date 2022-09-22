// import 'package:dio/dio.dart';

// import '../../../domain/entities/coin_entity.dart';
// import '../../dtos/coin_dto.dart';
// import '../get_all_coins_datasource.dart';
// import 'endpoints/coinbase.dart';

// class GetAllCoinsRemoteDatasourceImp implements GetAllCoinsDatasource {
//   final Dio _dio;
//   GetAllCoinsRemoteDatasourceImp(this._dio);

//   @override
//   Future<List<CoinEntity>> getAllCoins() async {
//     List<CoinEntity> coins = [];

//     final response = await _dio.get(Coinbase.getAllCoins);

//     coins = List.from(response.data['data'].map(
//       (coin) => CoinDto.fromJson(coin),
//     ));

//     return coins;
//   }
// }
