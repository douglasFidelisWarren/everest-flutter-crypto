import 'package:flutter/material.dart';

import '../../../../../l10n/core_strings.dart';
import '../../shared/styles.dart';

class ExchangeRow extends StatelessWidget {
  const ExchangeRow({
    Key? key,
    required this.toCoinSymbol,
    required this.valueExchange,
    required this.fromCoinSymbol,
  }) : super(key: key);

  final String toCoinSymbol;
  final double valueExchange;
  final String fromCoinSymbol;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          thickness: 1.5,
          color: colorGrayDivider,
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(CoreStrings.of(context)!.exchange, style: subTitleStyleMediun),
            Text(
                '1 $toCoinSymbol = ${valueExchange.toStringAsFixed(4)} $fromCoinSymbol',
                style: mediumBlackTitle)
          ]),
        ),
      ],
    );
  }
}
