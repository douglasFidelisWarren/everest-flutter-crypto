// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'coin_response.g.dart';

@JsonSerializable()
class CoinResponse {
  final String id;
  final String name;
  final String symbol;
  final String image;
  final double current_price;
  final double price_change_percentage_24h;

  CoinResponse(
    this.id,
    this.name,
    this.symbol,
    this.image,
    this.current_price,
    this.price_change_percentage_24h,
  );

  factory CoinResponse.fromJson(Map<String, dynamic> json) =>
      _$CoinResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CoinResponseToJson(this);
}
