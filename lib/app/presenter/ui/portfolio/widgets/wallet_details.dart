import 'package:decimal/decimal.dart';
import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:everest_crypto/app/presenter/ui/portfolio/widgets/coin_list.dart';
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
    // WalletDatasource walletDatasource =
    //     WalletDatasource(ref.watch(genckoEndpointProvider));
    Map<String, dynamic> userCoins = ref.watch(userCoinsProvider);

    AsyncValue<List<CoinViewData>> coins = ref.watch(walletNotifierProvider);

    Map<String, Decimal> prices = {};
    for (var coin in coins.value!) {
      prices[coin.id] = coin.currentPrice;
    }
    Decimal total = Decimal.parse("0");

    for (var price in prices.entries) {
      total += price.value * userCoins[price.key];
    }
    print('teste');
    print(total);
    // String getTotal() {

    //   Decimal total = Decimal.parse('0');

    //   for (var coin in userCoins.entries) {
    //     Decimal amount = coin.value *

    //     total = Decimal.parse(coin.value) + total;
    //   }
    //   return total.toString();
    // }

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
