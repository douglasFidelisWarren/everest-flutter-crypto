import 'package:decimal/decimal.dart';
import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../controllers/providers/get_wallet_provider.dart';
import '../../shared/formater.dart';
import '../../shared/styles.dart';
import 'visibility_button.dart';

class WalletDetails extends ConsumerWidget {
  const WalletDetails({
    Key? key,
    required this.visible,
    required this.changeVisibility,
    required AsyncValue<List<CoinViewData>> coin,
  }) : super(key: key);

  final bool visible;
  final Function changeVisibility;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userCoinsPricesProvider = Provider<Map<String, Decimal>>((ref) => {});

    AsyncValue<List<CoinViewData>> coinsWallet = ref.watch(coinsWalletProvider);
    for (var coin in coinsWallet.value!) {
      ref.read(userCoinsPricesProvider)[coin.id] = coin.currentPrice;
    }

    Map<String, dynamic> userCoins = ref.watch(userCoinsProvider);

    Map<String, Decimal> userCoinsPrices = ref.watch(userCoinsPricesProvider);
    Decimal total = Decimal.parse("0");

    for (var price in userCoinsPrices.entries) {
      total += price.value * userCoins[price.key];
    }

    final totalWallet = Provider<Decimal>((ref) => total);

    print('teste');
    print(total);

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Cripto", style: titleStyle),
              VisibilityButton(changeVisibility, visible),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              decoration: visibleDecoration(visible),
              child: Text(
                number.format(total.toDouble()),
                style: visible ? totalStyle : totalStyleHide,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const Text(
            "Valor total de moedas",
            style: subTitleStyleTotal,
          ),
        ],
      ),
    );
  }
}
