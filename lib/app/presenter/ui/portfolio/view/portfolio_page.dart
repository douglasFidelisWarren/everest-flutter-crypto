import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/entities/coins_view_data.dart';
import '../../../controllers/providers/get_coins_wallet_provider.dart';

import '../../shared/styles.dart';
import '../widgets/coin_details.dart';
import '../widgets/wallet_details.dart';

class PortfolioPage extends ConsumerWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  static const route = '/portfolio';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coins = ref.watch(coinsWalletProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8),
            coins.when(
              data: (data) => WalletDetails(coins: coins.value!),
              error: (error, stackTrace) => Text("ERRO: ${error.toString()}"),
              loading: () => const Center(),
            ),
            Expanded(
              child: coins.when(
                data: (data) => ListView.builder(
                  shrinkWrap: true,
                  itemCount: coins.value!.length,
                  itemBuilder: (context, index) {
                    CoinViewData coin = coins.value![index];
                    return CoinDetails(
                      coin: coin,
                    );
                  },
                ),
                error: (error, stackTrace) => Text("ERRO: ${error.toString()}"),
                loading: () => const Center(
                  child: CircularProgressIndicator(
                    color: colorBrandWarren,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
