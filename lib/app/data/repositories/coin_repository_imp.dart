import '../../domain/repositories/coin_repository.dart';
import '../datasources/api/endpoints/gencko_endpoints.dart';
import '../datasources/api/models/coin_response.dart';
import '../datasources/api/models/get_all_coins_response.dart';

class CoinRepositoryImp implements ICoinRepository {
  final GenckoEndpoints genckoEndpoint;

  CoinRepositoryImp({required this.genckoEndpoint});

  @override
  Future<GetAllCoinsResponse> getAllCoins(String vScurrency) async {
    final result = await genckoEndpoint.getAllCoins(vScurrency);
    return GetAllCoinsResponse(
        List.from(result.data.map((coin) => CoinResponse.fromJson(coin))));
  }
}
