import 'package:everest_crypto/app/data/datasources/api/models/coin_response.dart';
import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:everest_crypto/app/domain/repositories/coin_repository.dart';

import '../datasources/api/get_coins_endpoint.dart';
import '../datasources/api/models/get_all_coins_response.dart';

class CoinRepositoryImp implements ICoinRepository {
  final GetCoinsEndpoint getCoinsEndpoint;

  CoinRepositoryImp({required this.getCoinsEndpoint});

  @override
  Future<GetAllCoinsResponse> getAllCoins() async {
    final result = await getCoinsEndpoint.getAllCoins();
    return GetAllCoinsResponse(
        List.from(result.data.map((coin) => CoinResponse.fromJson(coin))));
  }

  //Future<GetAllCoinByIdResponse> getCoins(Strin....
}
