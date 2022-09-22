import 'package:decimal/decimal.dart';
import 'package:json_annotation/json_annotation.dart';

part 'prices_response.g.dart';

@JsonSerializable()
class PricesResponse {
  Decimal prices;
  Decimal marketcaps;
  Decimal totalvolumes;
  PricesResponse({
    required this.prices,
    required this.marketcaps,
    required this.totalvolumes,
  });

  factory PricesResponse.fromJson(Map<String, dynamic> json) =>
      _$PricesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PricesResponseToJson(this);
}
