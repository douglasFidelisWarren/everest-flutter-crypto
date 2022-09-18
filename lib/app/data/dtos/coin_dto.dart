import 'package:decimal/decimal.dart';
import 'package:everest_crypto/app/domain/entities/coin_entity.dart';

class CoinDto extends CoinEntity {
  CoinDto({
    required String id,
    required String name,
    required String image,
    required String symbol,
    required String latest,
    required String amount,
    required double percentChange,
  }) : super(
          id: id,
          image: image,
          latest: latest,
          name: name,
          symbol: symbol,
          amount: amount,
          percentChange: percentChange,
        );

  factory CoinDto.fromJson(Map<String, dynamic> json) => CoinDto(
        id: json['id'] ?? '',
        name: json['name'] ?? '',
        image: json['image_url'] ?? '',
        symbol: json['symbol'] ?? '',
        latest: json['latest'] ?? Decimal.parse("0"),
        amount: json['amount'] ?? '',
        percentChange: json['percent_change'] ?? '',
      );
}
