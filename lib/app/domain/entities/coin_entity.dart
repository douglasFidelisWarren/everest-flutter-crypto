import 'package:decimal/decimal.dart';

class CoinEntity {
  final int id;
  final String name;
  final String image;
  final String symbol;
  final Decimal latest;
  final Decimal amount;
  CoinEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.symbol,
    required this.latest,
    required this.amount,
  });
}
