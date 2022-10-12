import 'package:everest_crypto/app/domain/usecases/get_coin_prices_usecase.dart';
import 'package:everest_crypto/app/presenter/controllers/notifiers/get_coin_prices_notifier.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/fake_repo.dart';

void main() {
  test(
    "description",
    () async {
      FakeRepo repo;
      repo = FakeRepo();
      GetCoinPricesUsecaseImp _usecase;
      _usecase = GetCoinPricesUsecaseImp(repo);
      CoinPricesNotifier teste;
      teste = CoinPricesNotifier(_usecase);

      final prices = teste.getCoinPrices(
          coinId: "coinId", vScurrency: "vScurrency", days: 0);

      expect(prices == null, false);
    },
  );
}
