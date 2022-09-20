import 'package:decimal/decimal.dart';

class CoinEntity {
  final String id;
  final String name;
  final String image;
  final String symbol;
  final String latest;
  final String amount;
  final double percentChange;
  CoinEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.symbol,
    required this.latest,
    required this.amount,
    required this.percentChange,
  });
}
