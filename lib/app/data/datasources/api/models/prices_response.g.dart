// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prices_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PricesResponse _$PricesResponseFromJson(Map<String, dynamic> json) =>
    PricesResponse(
      prices: Decimal.fromJson(json['prices'] as String),
      marketcaps: Decimal.fromJson(json['marketcaps'] as String),
      totalvolumes: Decimal.fromJson(json['totalvolumes'] as String),
    );

Map<String, dynamic> _$PricesResponseToJson(PricesResponse instance) =>
    <String, dynamic>{
      'prices': instance.prices,
      'marketcaps': instance.marketcaps,
      'totalvolumes': instance.totalvolumes,
    };
