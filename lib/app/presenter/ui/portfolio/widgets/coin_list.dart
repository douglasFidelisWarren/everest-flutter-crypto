import 'package:everest_crypto/app/domain/entities/coin_entity.dart';
import 'package:flutter/material.dart';

import 'coin_details.dart';

class CoinList extends StatelessWidget {
  const CoinList({
    Key? key,
    required this.coinList,
    required this.visible,
  }) : super(key: key);

  final List<CoinEntity> coinList;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: coinList.length,
        itemBuilder: (context, index) {
          CoinEntity coin = coinList[index];

          return CoinDetails(
            coin: coin,
            visible: visible,
          );
        },
      ),
    );
  }
}
