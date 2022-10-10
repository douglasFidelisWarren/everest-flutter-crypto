import '../../domain/entities/coins_view_data.dart';
import 'get_all_coins_response.dart';

extension CoinMapper on GetAllCoinsResponse {
  List<CoinViewData> toViewData() {
    return results
        .map((result) => CoinViewData(
              id: result.id,
              name: result.name,
              symbol: result.symbol,
              image: result.image,
              currentPrice: result.current_price,
              percentage24h: result.price_change_percentage_24h,
            ))
        .toList();
  }
}
