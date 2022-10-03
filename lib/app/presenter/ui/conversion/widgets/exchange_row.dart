import 'package:flutter/material.dart';

import '../../shared/styles.dart';

class ExchangeRow extends StatelessWidget {
  const ExchangeRow({
    Key? key,
    required this.fromSymbol,
    required this.exchange,
    required this.toSymbol,
  }) : super(key: key);

  final String fromSymbol;
  final double exchange;
  final String toSymbol;

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
            const Text('Câmbio', style: subTitleStyleMediun),
            Text('1 $fromSymbol = ${exchange.toStringAsFixed(2)} $toSymbol',
                style: mediumBlackTitle)
          ]),
        ),
      ],
    );
  }
}
