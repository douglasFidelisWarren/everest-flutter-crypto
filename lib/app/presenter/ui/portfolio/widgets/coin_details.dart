import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/entities/coins_view_data.dart';
import '../../../controllers/providers/chart_config_provider.dart';
import '../../../controllers/providers/coin_prices_provider.dart';
import '../../../controllers/providers/visible_provider.dart';
import '../../details/view/details_page.dart';
import '../../details/widgets/line_chart_coin.dart';
import '../../shared/formater.dart';
import '../../shared/styles.dart';

class CoinDetails extends ConsumerWidget {
  const CoinDetails({
    Key? key,
    required this.coin,
  }) : super(key: key);

  final CoinViewData coin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visible = ref.watch(visibleProvider);
    AsyncValue prices = ref.watch(coinPricesNotifierProvider);
    return MaterialButton(
      onPressed: () {
        ref.read(selectedProvider.state).state = 5;
        ref
            .read(coinPricesNotifierProvider.notifier)
            .getCoinPrices(coinId: coin.id, vScurrency: "brl", days: 5);
        ref.watch(chartConfigProvider.notifier).getChartConfig(prices.value);
        Navigator.of(context).pushNamed(DetailsPage.route, arguments: coin);
      },
      child: SizedBox(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
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
                      child: Image(
                        key: const Key("coinImage"),
                        image: NetworkImage(coin.image, scale: 4),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .25,
                          child: Text(coin.symbol.toUpperCase(),
                              style: mediumBlackTitle,
                              overflow: TextOverflow.clip),
                        ),
                        const SizedBox(height: 4),
                        Text(coin.name,
                            key: const Key("coinName"),
                            style: smallGraySubTitle),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          decoration: visibleDecoration(visible),
                          child: Container(
                            alignment: Alignment.centerRight,
                            width: MediaQuery.of(context).size.width * .35,
                            child: Text(
                              key: const Key("coinAmountVsCurrency"),
                              number.format(coin.amountVsCurrency!.toDouble()),
                              overflow: TextOverflow.clip,
                              style: visible
                                  ? mediumBlackTitle
                                  : subTitleSmallHide,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Container(
                              decoration: visibleDecoration(visible),
                              child: Text(
                                key: const Key("coinAmount"),
                                coin.amount!.toStringAsFixed(2),
                                style: visible
                                    ? smallGraySubTitle
                                    : subTitleStyleCoinHide,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(coin.symbol.toUpperCase(),
                                key: const Key("coinSymbol"),
                                style: smallGraySubTitle),
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
      ),
    );
  }
}
