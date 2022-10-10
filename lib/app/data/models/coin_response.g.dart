// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinResponse _$CoinResponseFromJson(Map<String, dynamic> json) => CoinResponse(
      json['id'] as String,
      json['name'] as String,
      json['symbol'] as String,
      json['image'] as String,
      (json['current_price'] as num).toDouble(),
      (json['price_change_percentage_24h'] as num).toDouble(),
    );

Map<String, dynamic> _$CoinResponseToJson(CoinResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'image': instance.image,
      'current_price': instance.current_price,
      'price_change_percentage_24h': instance.price_change_percentage_24h,
    };
