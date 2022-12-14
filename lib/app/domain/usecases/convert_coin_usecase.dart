import 'package:decimal/decimal.dart';
import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:everest_crypto/app/domain/entities/exchange_entity.dart';

abstract class IConvertCoinUsecase {
  ExchangeViewData convertCoin({
    required CoinViewData fromCoin,
    required CoinViewData toCoin,
    required Decimal amtConvert,
  });
}

class ConvertCoinUsecaseImp implements IConvertCoinUsecase {
  @override
  ExchangeViewData convertCoin({
    required CoinViewData fromCoin,
    required CoinViewData toCoin,
    required Decimal amtConvert,
  }) {
    double valor =
        fromCoin.currentPrice.toDouble() / toCoin.currentPrice.toDouble();
    double amtReceive =
        (amtConvert.toDouble() * fromCoin.currentPrice.toDouble()) /
            toCoin.currentPrice.toDouble();

    ExchangeViewData entity = ExchangeViewData(
      fromCoin: fromCoin,
      toCoin: toCoin,
      amtConvert: amtConvert,
      amtReceive: Decimal.parse(amtReceive.toString()),
      date: DateTime.now(),
      valueExchange: Decimal.parse(valor.toString()),
    );

    return entity;
  }
}
