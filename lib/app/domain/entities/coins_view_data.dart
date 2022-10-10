import 'package:decimal/decimal.dart';

class CoinViewData {
  final String id;
  final String name;
  final String symbol;
  final String image;
  final double currentPrice;
  final double? amount;
  final double? amountVsCurrency;
  final double percentage24h;
  CoinViewData({
    this.amount,
    this.amountVsCurrency,
    required this.id,
    required this.name,
    required this.symbol,
    required this.image,
    required this.currentPrice,
    required this.percentage24h,
  });
}
