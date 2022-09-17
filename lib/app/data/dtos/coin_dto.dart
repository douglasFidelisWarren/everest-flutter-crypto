import 'package:decimal/decimal.dart';
import 'package:everest_crypto/app/domain/entities/coin_entity.dart';

class CoinDto extends CoinEntity {
  CoinDto(
      {required String id,
      required String name,
      required String image,
      required String symbol,
      required Decimal latest,
      required Decimal amount})
      : super(
          id: id,
          image: image,
          latest: latest,
          name: name,
          symbol: symbol,
          amount: amount,
        );

  factory CoinDto.fromJson(Map<String, dynamic> json) => CoinDto(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        symbol: json['symbol'],
        latest: json['latest'],
        amount: json['amount'],
      );
}
