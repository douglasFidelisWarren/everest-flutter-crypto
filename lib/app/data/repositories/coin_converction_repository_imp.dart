import 'package:everest_crypto/app/data/datasources/api/endpoints/gencko_endpoints.dart';
import 'package:everest_crypto/app/data/models/get_all_coins_response.dart';
import 'package:everest_crypto/app/domain/repositories/i_coin_converction_repository.dart';

import '../models/coin_response.dart';

class CoinConverctionRepositoryImp implements ICoinConverctionRepository {
  final GenckoEndpoints _genckoEndpoints;

  CoinConverctionRepositoryImp(this._genckoEndpoints);

  @override
  Future<GetAllCoinsResponse> getConverction(
      {required String coinId, required String vsCurrency}) async {
    final result = await _genckoEndpoints.getCoinConverction(
        coinId: coinId, vScurrency: vsCurrency);
    return GetAllCoinsResponse(
        List.from(result.data.map((coin) => CoinResponse.fromJson(coin))));
  }
}
