import '../../data/dtos/coin_mapper.dart';
import '../entities/coins_view_data.dart';
import '../repositories/coin_repository.dart';

abstract class ICoinUsecase {
  Future<List<CoinViewData>> getAllCoins(String vScurrency);
}

class GetCoinsUsecaseImp implements ICoinUsecase {
  final ICoinRepository _repository;

  GetCoinsUsecaseImp(this._repository);

  @override
  Future<List<CoinViewData>> getAllCoins(String vScurrency) async {
    final response = await _repository.getAllCoins(vScurrency);

    return response.toViewData();
  }
}
