import 'package:flutter/material.dart';

import '../../shared/styles.dart';

class ReceiveRow extends StatelessWidget {
  const ReceiveRow({
    Key? key,
    required this.amountReceive,
    required this.toSymbol,
  }) : super(key: key);

  final double amountReceive;
  final String toSymbol;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Divider(
          thickness: 1.5,
          color: colorGrayDivider,
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Receber',
                style: subTitleStyleMediun,
              ),
              Text(
                '${amountReceive.toStringAsFixed(4)} $toSymbol',
                style: mediumBlackTitle,
              )
            ],
          ),
        ),
      ],
    );
  }
}
