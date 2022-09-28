import 'package:decimal/decimal.dart';

import '../../data/models/get_all_coins_response.dart';

abstract class ICoinConverctionRepository {
  Future<GetAllCoinsResponse> getConverction(
      {required String coinId, required String vsCurrency});
}
