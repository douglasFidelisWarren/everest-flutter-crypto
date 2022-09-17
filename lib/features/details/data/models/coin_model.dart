import 'package:everest_crypto/features/details/domain/entities/coin_entity.dart';

class CoinModel extends CoinEntity {
  CoinModel({
    required String id,
    required String name,
    required String image,
    required String symbol,
    required String latest,
  }) : super(
          id: id,
          image: image,
          latest: latest,
          name: name,
          symbol: symbol,
        );

  factory CoinModel.fromJson(Map<String, dynamic> json) => CoinModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        symbol: json['symbol'],
        latest: json['latest'],
      );
}
