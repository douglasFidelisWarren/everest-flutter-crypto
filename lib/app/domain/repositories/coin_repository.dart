import '../../data/datasources/api/models/get_all_coins_response.dart';

abstract class ICoinRepository {
  Future<GetAllCoinsResponse> getAllCoins(String vScurrency);
}
