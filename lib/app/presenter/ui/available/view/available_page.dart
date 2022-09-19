import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/entities/coin_entity.dart';
import '../../../controllers/providers/get_all_coins_provider.dart';
import '../../shared/custom_app_bar.dart';
import '../widgets/available_card_coin.dart';

class AvailablePage extends ConsumerWidget {
  const AvailablePage({Key? key}) : super(key: key);

  static const route = '/available';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coins = ref.watch(coinsNotifierProvider);

    return Scaffold(
      appBar: const CustomAppBar('Criptos Disponíveis'),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: coins.when(
                data: (data) => ListView.builder(
                  shrinkWrap: true,
                  itemCount: coins.value!.length,
                  itemBuilder: (context, index) {
                    CoinEntity coin = coins.value![index];
                    double percentChange = double.parse(
                      (coin.percentChange).toStringAsFixed(4),
                    );
                    return AvailableCardCoin(
                        coin: coin, percentChange: percentChange);
                  },
                ),
                error: (error, stackTrace) => Text("Erro: ${error.toString()}"),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
