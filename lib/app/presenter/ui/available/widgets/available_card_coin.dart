import 'package:flutter/material.dart';

import '../../../../domain/entities/coins_view_data.dart';
import '../../shared/formater.dart';
import '../../shared/styles.dart';

class AvailableCardCoin extends StatelessWidget {
  const AvailableCardCoin({Key? key, required this.coin}) : super(key: key);

  final CoinViewData coin;

  @override
  Widget build(BuildContext context) {
    double percentChange = double.parse(
      (coin.percentage24h).toStringAsFixed(4),
    );
    return MaterialButton(
      key: Key(coin.id),
      onPressed: () {},
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(6),
            child: Card(
              elevation: 10,
              child: Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 12, right: 12, top: 22, bottom: 22),
                      child: Image.network(
                        coin.image,
                        height: 50,
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(coin.symbol, style: mediumBlackTitle),
                      const SizedBox(height: 4),
                      Text(coin.name, style: smallGraySubTitle),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          number.format((coin.currentPrice).toDouble()),
                          style: mediumBlackTitle,
                        ),
                        const SizedBox(height: 5),
                        Container(
                          alignment: Alignment.center,
                          width: 80,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: percentChange < 0
                                  ? Colors.red.shade200
                                  : Colors.green.shade200),
                          child: Text(
                            "${double.parse((percentChange).toStringAsFixed(4))}%",
                            style: const TextStyle(
                              color: colorBlackText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
