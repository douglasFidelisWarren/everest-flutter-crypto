// ignore_for_file: invalid_use_of_protected_member

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
      GetCoinPricesUsecaseImp usecase;
      usecase = GetCoinPricesUsecaseImp(repo);
      CoinPricesNotifier coinPricesNotifier;
      coinPricesNotifier = CoinPricesNotifier(usecase);
      coinPricesNotifier.getCoinPrices(
          coinId: "coinId", vScurrency: "vScurrency", days: 0);
      final prices = coinPricesNotifier.state;

      expect(coinPricesNotifier.state, equals(prices));
    },
  );
}
