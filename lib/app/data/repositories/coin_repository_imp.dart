import 'package:everest_crypto/app/data/datasources/api/models/coin_response.dart';
import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:everest_crypto/app/domain/repositories/coin_repository.dart';

import '../datasources/api/genckoEndpoints.dart';
import '../datasources/api/models/get_all_coins_response.dart';

class CoinRepositoryImp implements ICoinRepository {
  final GenckoEndpoints genkcoEndpoint;

  CoinRepositoryImp({required this.genkcoEndpoint});

  @override
  Future<GetAllCoinsResponse> getAllCoins(String vScurrency) async {
    final result = await genkcoEndpoint.getAllCoins(vScurrency);
    return GetAllCoinsResponse(
        List.from(result.data.map((coin) => CoinResponse.fromJson(coin))));
  }

  //Future<GetAllCoinByIdResponse> getCoins(Strin....
}
