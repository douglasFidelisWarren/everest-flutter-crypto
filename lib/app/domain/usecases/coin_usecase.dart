import '../../data/dtos/coin_mapper.dart';
import '../entities/coins_view_data.dart';
import '../repositories/coin_repository.dart';

abstract class ICoinUsecase {
  Future<List<CoinViewData>> getAllCoins();
}

class GetCoinsUsecaseImp implements ICoinUsecase {
  final ICoinRepository _repository;

  GetCoinsUsecaseImp(this._repository);

  @override
  Future<List<CoinViewData>> getAllCoins() async {
    final response = await _repository.getAllCoins();

    return response.toViewData();
  }
}
