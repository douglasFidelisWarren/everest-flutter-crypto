import 'package:decimal/decimal.dart';
import 'package:everest_crypto/app/domain/entities/exchange_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/coins_view_data.dart';
import '../../../domain/usecases/convert_coin_usecase.dart';

final textFormValueProvider = StateProvider<double>((ref) => 0);

final helpTextProvider = StateProvider<String>(
  (ref) => '',
);

final isValidProvider = StateProvider<bool>(
  (ref) => false,
);

final animateProvider = StateProvider<bool>(
  (ref) => true,
);

final toCoinProvider = StateProvider<CoinViewData>(
  (ref) => CoinViewData(
      id: '',
      name: '',
      symbol: '',
      image: '',
      currentPrice: 0,
      percentage24h: 0),
);

final convertCoinProvider = Provider(
  (ref) {
    return ConvertCoinUsecaseImp();
  },
);

final exchangesListProvider = StateProvider<List<ExchangeEntity>>(
  (ref) => [],
);
