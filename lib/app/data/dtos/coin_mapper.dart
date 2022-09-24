import 'package:decimal/decimal.dart';

import '../../domain/entities/coins_view_data.dart';
import '../datasources/api/models/get_all_coins_response.dart';

extension CoinMapper on GetAllCoinsResponse {
  List<CoinViewData> toViewData() {
    return results
        .map((result) => CoinViewData(Decimal.parse("0"),
            id: result.id,
            name: result.name,
            symbol: result.symbol,
            image: result.image,
            currentPrice: result.currentPrice,
            percentage24h: result.percentage24h))
        .toList();
  }
}
