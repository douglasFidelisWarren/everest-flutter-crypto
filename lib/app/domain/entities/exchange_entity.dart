import 'package:decimal/decimal.dart';

class ExchangeEntity {
  Decimal fromCoinPrice;
  String fromCoinSymbol;
  Decimal toCoinPrice;
  String toCoinSymbol;
  Decimal amtConvert;
  Decimal amtReceive;
  DateTime date;
  Decimal value;
  ExchangeEntity({
    required this.fromCoinPrice,
    required this.fromCoinSymbol,
    required this.toCoinPrice,
    required this.toCoinSymbol,
    required this.amtConvert,
    required this.amtReceive,
    required this.date,
    required this.value,
  });
}
