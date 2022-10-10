import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/entities/coins_view_data.dart';
import 'coin_details.dart';
import 'wallet_details.dart';

class PageBody extends ConsumerWidget {
  const PageBody({super.key, required this.coins});

  final List<CoinViewData> coins;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
        child: Column(
      children: [
        const SizedBox(height: 8),
        WalletDetails(coins: coins),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: coins.length,
            itemBuilder: (context, index) {
              CoinViewData coin = coins[index];
              // ref.read(detailCoinProvider.state).state = coins[index];
              return CoinDetails(
                coin: coin,
              );
            },
          ),
        ),
      ],
    ));
  }
}
