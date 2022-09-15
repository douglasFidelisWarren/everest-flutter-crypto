import 'package:flutter/material.dart';

import '../model/coin.dart';
import 'coin_details.dart';

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
    return Expanded(
      child: ListView.builder(
        itemCount: coinList.length,
        itemBuilder: (context, index) {
          Coin coin = coinList[index];

          return CoinDetails(
            coin: coin,
            visible: visible,
          );
        },
      ),
    );
  }
}
