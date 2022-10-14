import 'package:json_annotation/json_annotation.dart';

import 'coin_response.dart';

part 'get_all_coins_response.g.dart';

@JsonSerializable()
class GetAllCoinsResponse {
  final List<CoinResponse> results;

  GetAllCoinsResponse(this.results);

  Map<String, dynamic> toJson() => _$GetAllCoinsResponseToJson(this);
}
