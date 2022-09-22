import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../controllers/providers/get_chart_config_provider.dart';
import '../../../controllers/providers/get_coin_prices_provider.dart';
import 'coin_details.dart';

class CoinList extends HookConsumerWidget {
  const CoinList({
    Key? key,
    required this.coinList,
    required this.visible,
  }) : super(key: key);

  final List<CoinViewData> coinList;
  final bool visible;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue prices = ref.read(coinPricesNotifierProvider);
    ref.read(chartConfigProvider.notifier).getChartConfig(prices.value);
    return Expanded(
      child: ListView.builder(
        itemCount: coinList.length,
        itemBuilder: (context, index) {
          CoinViewData coin = coinList[index];
          return CoinDetails(
            coin: coin,
            visible: visible,
          );
        },
      ),
    );
  }
}
