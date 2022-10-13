import 'package:decimal/decimal.dart';
import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';

class ExchangeViewData {
  CoinViewData fromCoin;
  CoinViewData toCoin;
  Decimal amtConvert;
  Decimal amtReceive;
  DateTime date;
  Decimal valueExchange;
  ExchangeViewData({
    required this.fromCoin,
    required this.toCoin,
    required this.amtConvert,
    required this.amtReceive,
    required this.date,
    required this.valueExchange,
  });
}
