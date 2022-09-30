import 'package:decimal/decimal.dart';
import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:everest_crypto/app/domain/entities/exchange_entity.dart';

abstract class IConvertCoin {
  ExchangeEntity convertCoin({
    required CoinViewData fromCoin,
    required CoinViewData toCoin,
    required Decimal amtConvert,
  });
}

class ConvertCoinImp implements IConvertCoin {
  @override
  ExchangeEntity convertCoin(
      {required CoinViewData fromCoin,
      required CoinViewData toCoin,
      required Decimal amtConvert}) {
    ExchangeEntity entity = ExchangeEntity(
      fromCoinPrice: fromCoin.currentPrice,
      fromCoinSymbol: fromCoin.symbol.toUpperCase(),
      toCoinPrice: toCoin.currentPrice,
      toCoinSymbol: toCoin.symbol.toUpperCase(),
      amtConvert: amtConvert,
      amtReceive: amtReceive,
      date: DateTime.now(),
      value: value,
    );

    return entity;
  }
}
