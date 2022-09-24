import 'package:decimal/decimal.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wallet_response.g.dart';

@JsonSerializable()
class WalletResponse {
  final String id;
  final String name;
  final String symbol;
  final String image;
  final Decimal currentPrice;
  final Decimal amount;
  final double percentage24h;

  WalletResponse(
    this.id,
    this.name,
    this.symbol,
    this.image,
    this.currentPrice,
    this.amount,
    this.percentage24h,
  );

  factory WalletResponse.fromJson(Map<String, dynamic> json) =>
      _$WalletResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WalletResponseToJson(this);
}
