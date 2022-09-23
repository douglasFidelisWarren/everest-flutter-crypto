// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prices_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PricesResponse _$PricesResponseFromJson(Map<String, dynamic> json) =>
    PricesResponse(
      prices: Decimal.fromJson(json['prices'] as String),
      marketcaps: Decimal.fromJson(json['market_caps'] as String),
      totalvolumes: Decimal.fromJson(json['total_volumes'] as String),
    );

Map<String, dynamic> _$PricesResponseToJson(PricesResponse instance) =>
    <String, dynamic>{
      'prices': instance.prices,
      'market_caps': instance.marketcaps,
      'total_volumes': instance.totalvolumes,
    };
