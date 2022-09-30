import 'package:decimal/decimal.dart';
import 'package:everest_crypto/app/domain/repositories/i_coin_converction_repository.dart';

import '../../data/models/coin_mapper.dart';
import '../entities/coins_view_data.dart';

abstract class IGetConverctionUsecase {
  Future<List<CoinViewData>> getConverction(
      {required String coinId, required String vsCurrency});
}

class GetConverctionUsecaseImp implements IGetConverctionUsecase {
  final ICoinConverctionRepository _repository;

  GetConverctionUsecaseImp(this._repository);

  @override
  Future<List<CoinViewData>> getConverction(
      {required String coinId, required String vsCurrency}) async {
    final response = await _repository.getConverction(
        coinId: coinId, vsCurrency: vsCurrency);

    return response.toViewData();
  }
}
