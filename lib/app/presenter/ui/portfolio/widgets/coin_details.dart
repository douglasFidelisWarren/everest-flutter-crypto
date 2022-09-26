import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/entities/coins_view_data.dart';
import '../../../controllers/providers/chart_config_provider.dart';
import '../../../controllers/providers/coin_prices_provider.dart';
import '../../details/view/details_page.dart';
import '../../details/widgets/line_chart_coin.dart';
import '../../shared/formater.dart';
import '../../shared/styles.dart';

class CoinDetails extends HookConsumerWidget {
  const CoinDetails({
    Key? key,
    required this.coin,
    required this.visible,
  }) : super(key: key);

  final CoinViewData coin;
  final bool visible;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue prices = ref.watch(coinsNotifierProvider);

    return prices.when(
      error: (error, stackTrace) => Text("ERRO: $error"),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      data: (data) => MaterialButton(
        onPressed: () {
          ref.read(selectedProvider.state).state = 5;
          ref
              .read(coinsNotifierProvider.notifier)
              .getCoinPrices(coin.id, "brl", 5);
          // ref.watch(chartConfigProvider.notifier).getChartConfig([]);
          ref.watch(chartConfigProvider.notifier).getChartConfig(prices.value);
          Navigator.of(context).pushNamed(DetailsPage.route, arguments: coin);
        },
        child: Column(
          children: [
            const Divider(
              color: colorGrayDivider,
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 18),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.network(
                      coin.image,
                      height: 50,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .25,
                        child: Text(coin.symbol.toUpperCase(),
                            style: valueStyle, overflow: TextOverflow.clip),
                      ),
                      const SizedBox(height: 4),
                      Text(coin.name, style: subTitleStyleCoin),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: visibleDecoration(visible),
                        child: Container(
                          alignment: Alignment.centerRight,
                          width: MediaQuery.of(context).size.width * .35,
                          child: Text(
                            number.format(coin.amountVsCurrency.toDouble()),
                            overflow: TextOverflow.clip,
                            style: visible ? valueStyle : valueStyleHide,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Container(
                            decoration: visibleDecoration(visible),
                            child: Text(
                              coin.amount.toStringAsFixed(2),
                              style: visible
                                  ? subTitleStyleCoin
                                  : subTitleStyleCoinHide,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(coin.symbol.toUpperCase(),
                              style: subTitleStyleCoin),
                        ],
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 30.0, left: 10),
                    child: Icon(Icons.arrow_forward_ios_sharp, size: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
