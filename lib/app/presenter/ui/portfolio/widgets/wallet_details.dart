import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/entities/coins_view_data.dart';
import '../../shared/formater.dart';
import '../../shared/styles.dart';
import 'visibility_button.dart';

class WalletDetails extends ConsumerWidget {
  const WalletDetails({
    Key? key,
    required this.visible,
    required this.changeVisibility,
    required this.coins,
  }) : super(key: key);

  final bool visible;
  final Function changeVisibility;
  final AsyncValue<List<CoinViewData>> coins;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Decimal valueTotal = Decimal.parse('0');

    for (var coin in coins.value!) {
      valueTotal += coin.amountVsCurrency!;
    }

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
                number.format(valueTotal.toDouble()),
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
