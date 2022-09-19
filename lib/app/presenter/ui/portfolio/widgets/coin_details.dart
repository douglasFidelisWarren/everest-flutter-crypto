import 'package:decimal/decimal.dart';
import 'package:everest_crypto/app/domain/entities/chart_config_entity.dart';
import 'package:everest_crypto/app/presenter/controllers/providers/get_chart_config_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../controllers/providers/get_coin_prices_provider.dart';
import '../../shared/formater.dart';
import '../../shared/styles.dart';
import '../../../../domain/entities/coin_entity.dart';
import '../../details/details_page.dart';

class CoinDetails extends HookConsumerWidget {
  const CoinDetails({
    Key? key,
    required this.coin,
    required this.visible,
  }) : super(key: key);

  final CoinEntity coin;
  final bool visible;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Decimal amount = Decimal.parse(coin.amount);
    Decimal latest = Decimal.parse(coin.latest);
    double value = (amount * latest).toDouble();
    double amountCoin = amount.toDouble();

    return MaterialButton(
      onPressed: () {
        ref
            .read(coinPricesNotifierProvider.notifier)
            .getCoinPrices(coin.id, "hour");
        print(coin.id);
        print(coin.name);
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
                  child: Image(
                    height: 50,
                    image: AssetImage(coin.image),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(coin.symbol, style: valueStyle),
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
                      child: Text(
                        number.format(value),
                        style: visible ? valueStyle : valueStyleHide,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Container(
                          decoration: visibleDecoration(visible),
                          child: Text(
                            number.format(amountCoin),
                            style: visible
                                ? subTitleStyleCoin
                                : subTitleStyleCoinHide,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(coin.symbol, style: subTitleStyleCoin),
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
    );
  }
}
