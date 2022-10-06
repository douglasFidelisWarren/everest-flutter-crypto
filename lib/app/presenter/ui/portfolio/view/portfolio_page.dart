import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/entities/coins_view_data.dart';
import '../../../controllers/providers/chart_config_provider.dart';
import '../../../controllers/providers/coin_prices_provider.dart';
import '../../../controllers/providers/get_coins_wallet_provider.dart';

import '../../../controllers/providers/visible_provider.dart';
import '../../details/view/details_page.dart';
import '../../details/widgets/line_chart_coin.dart';
import '../../shared/formater.dart';
import '../../shared/styles.dart';
import '../widgets/coin_details.dart';
import '../widgets/wallet_details.dart';

class PortfolioPage extends ConsumerWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  static const route = '/portfolio';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coins = ref.watch(coinsWalletProvider);

    AsyncValue prices = ref.watch(coinPricesNotifierProvider);

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
            coins.when(
              data: (data) => Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: coins.value!.length,
                  itemBuilder: (context, index) {
                    CoinViewData coin = coins.value![index];
                    return prices.when(
                      error: (error, stackTrace) => const Text(
                        "ERRO",
                        key: Key("whenPricesError"),
                      ),
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      data: (data) => CoinDetails(
                        coin: coin,
                      ),
                    );
                  },
                ),
              ),
              error: (error, stackTrace) => Text("ERRO: ${error.toString()}"),
              loading: () => const Center(
                child: CircularProgressIndicator(
                  color: colorBrandWarren,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
