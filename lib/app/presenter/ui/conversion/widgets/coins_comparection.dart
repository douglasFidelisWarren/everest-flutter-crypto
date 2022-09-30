import 'package:flutter/material.dart';

import '../../../../domain/entities/coins_view_data.dart';
import '../../shared/styles.dart';
import 'coin_drop_down_form.dart';

class CoinsComparection extends StatelessWidget {
  const CoinsComparection({
    Key? key,
    required this.coinANT,
    required this.listaDrop,
  }) : super(key: key);

  final CoinViewData coinANT;
  final List<CoinViewData> listaDrop;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
        padding: const EdgeInsets.only(left: 5, right: 10, top: 5, bottom: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 1.5,
              color: colorGrayDivider,
            )),
        child: Row(children: [
          Image.network(
            coinANT.image,
            height: 25,
          ),
          Text(
            ' ${coinANT.symbol.toUpperCase()}',
          ),
        ]),
      ),
      const Image(
        height: 25,
        image: AssetImage(
          "assets/images/transactions.png",
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(
          left: 5,
          right: 10,
          top: 5,
          bottom: 5,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 1.5,
            color: colorGrayDivider,
          ),
        ),
        width: 100,
        child: CoinDropDownForm(
          listaDrop: listaDrop,
        ),
      ),
    ]);
  }
}
