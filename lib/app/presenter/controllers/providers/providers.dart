import 'package:decimal/decimal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/coins_view_data.dart';

final detailCoinProvider = StateProvider(
  (ref) => CoinViewData(
      amount: 0,
      amountVsCurrency: 0,
      id: "id",
      name: "name",
      symbol: "symbol",
      image: "image",
      currentPrice: 0,
      percentage24h: 0),
);
