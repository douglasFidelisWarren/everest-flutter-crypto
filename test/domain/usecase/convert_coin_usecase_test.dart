import 'package:decimal/decimal.dart';
import 'package:everest_crypto/app/domain/entities/exchange_entity.dart';
import 'package:everest_crypto/app/domain/usecases/convert_coin_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/fake_repo.dart';

void main() {
  late ConvertCoinUsecaseImp convertCoinUsecase;
  late FakeRepo repo;
  late ExchangeViewData exchangeEntity;

  setUp(() {
    convertCoinUsecase = ConvertCoinUsecaseImp();
    repo = FakeRepo();
    exchangeEntity = convertCoinUsecase.convertCoin(
      fromCoin: repo.getCoin(),
      toCoin: repo.getCoin(),
      amtConvert: Decimal.parse("1"),
    );
  });

  test(
    "WHEN convertCoin called THEN returns ExchangeEntity",
    () {
      final entity = convertCoinUsecase.convertCoin(
        fromCoin: repo.getCoin(),
        toCoin: repo.getCoin(),
        amtConvert: Decimal.parse("1"),
      );
      expect(entity.amtConvert, exchangeEntity.amtConvert);
    },
  );
}
