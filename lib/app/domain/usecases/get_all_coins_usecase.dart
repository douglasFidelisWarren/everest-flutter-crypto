import '../../data/models/coin_mapper.dart';
import '../entities/coins_view_data.dart';
import '../repositories/icoin_repository.dart';

abstract class IGetAllCoinsUsecase {
  Future<List<CoinViewData>> getAllCoins(String vScurrency);
}

class GetAllCoinsUsecaseImp implements IGetAllCoinsUsecase {
  final ICoinRepository _repository;

  GetAllCoinsUsecaseImp(this._repository);

  @override
  Future<List<CoinViewData>> getAllCoins(String vScurrency) async {
    final response = await _repository.getAllCoins(vScurrency);

    return response.toViewData();
  }
}
