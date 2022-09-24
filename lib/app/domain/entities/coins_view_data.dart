import 'package:decimal/decimal.dart';

class CoinViewData {
  final String id;
  final String name;
  final String symbol;
  final String image;
  final Decimal currentPrice;
  final Decimal amount;
  final double percentage24h;
  CoinViewData(
    this.amount, {
    required this.id,
    required this.name,
    required this.symbol,
    required this.image,
    required this.currentPrice,
    required this.percentage24h,
  });
}
