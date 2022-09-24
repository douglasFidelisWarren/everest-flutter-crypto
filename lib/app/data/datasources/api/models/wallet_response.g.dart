// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletResponse _$WalletResponseFromJson(Map<String, dynamic> json) =>
    WalletResponse(
      json['id'] as String,
      json['name'] as String,
      json['symbol'] as String,
      json['image'] as String,
      Decimal.fromJson(json['currentPrice'] as String),
      Decimal.fromJson(json['amount'] as String),
      (json['percentage24h'] as num).toDouble(),
    );

Map<String, dynamic> _$WalletResponseToJson(WalletResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'image': instance.image,
      'currentPrice': instance.currentPrice,
      'amount': instance.amount,
      'percentage24h': instance.percentage24h,
    };
