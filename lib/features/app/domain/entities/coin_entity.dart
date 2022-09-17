import 'dart:convert';

class CoinEntity {
  final String id;
  final String name;
  final String image;
  final String symbol;
  final String latest;
  CoinEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.symbol,
    required this.latest,
  });
}
