import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/entities/coins_view_data.dart';
import '../../../controllers/providers/get_wallet_provider.dart';
import '../../../controllers/providers/visible_provider.dart';
import '../../shared/styles.dart';
import '../widgets/coin_details.dart';
import '../widgets/wallet_details.dart';

class PortfolioPage extends HookConsumerWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  static const route = '/portfolio';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visible = ref.watch(visibleProvider);
    final coins = ref.watch(coinsWalletProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8),
            coins.when(
              data: (data) => WalletDetails(
                  coins: coins,
                  visible: visible,
                  changeVisibility: () {
                    ref.watch(visibleProvider.state).state = !visible;
                  }),
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
                      visible: visible,
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
