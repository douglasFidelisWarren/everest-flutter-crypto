import 'package:everest_crypto/app/domain/entities/coin_entity.dart';
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

  final List<CoinEntity> coinList;
  final bool visible;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref
    //     .read(coinPricesNotifierProvider.notifier)
    //    .getCoinPrices(coinList[0].id, "day");
    ref
        .read(chartConfigProvider.notifier)
        .getChartConfig(ref.watch(coinPricesNotifierProvider).value!);
    return Expanded(
      child: ListView.builder(
        itemCount: coinList.length,
        itemBuilder: (context, index) {
          CoinEntity coin = coinList[index];
          return CoinDetails(
            coin: coin,
            visible: visible,
          );
        },
      ),
    );
  }
}
