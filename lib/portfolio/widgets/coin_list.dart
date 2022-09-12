import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

import '../../models/coin.dart';
import '../../shared/styles.dart';
import 'coin_datails.dart';

class CoinList extends StatelessWidget {
  const CoinList({
    Key? key,
    required this.coinList,
    required this.visible,
  }) : super(key: key);

  final List<Coin> coinList;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    Decoration hideText = BoxDecoration(
      color: visible ? colorHideOff : colorHideOn,
      borderRadius: BorderRadius.circular(5),
    );
    return Expanded(
      child: ListView.builder(
        itemCount: coinList.length,
        itemBuilder: (context, index) {
          Coin coin = coinList[index];
          var amount = Decimal.parse(coin.amount);
          var latest = Decimal.parse(coin.latest);
          double value = (amount * latest).toDouble();
          return CoinDetails(
            coin: coin,
            hideText: hideText,
            value: value,
            visible: visible,
          );
        },
      ),
    );
  }
}
