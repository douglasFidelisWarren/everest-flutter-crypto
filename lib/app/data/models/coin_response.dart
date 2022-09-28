import 'package:decimal/decimal.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coin_response.g.dart';

@JsonSerializable()
class CoinResponse {
  final String id;
  final String name;
  final String symbol;
  final String image;
  final Decimal currentPrice;
  final double percentage24h;

  CoinResponse(
    this.id,
    this.name,
    this.symbol,
    this.image,
    this.currentPrice,
    this.percentage24h,
  );

  factory CoinResponse.fromJson(Map<String, dynamic> json) =>
      _$CoinResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CoinResponseToJson(this);
}
