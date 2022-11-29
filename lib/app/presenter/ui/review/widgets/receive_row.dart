import 'package:flutter/material.dart';

import '../../../../../l10n/core_strings.dart';
import '../../../../domain/entities/exchange_entity.dart';
import '../../shared/styles.dart';

class ReceiveRow extends StatelessWidget {
  const ReceiveRow({
    Key? key,
    required this.currentExchange,
  }) : super(key: key);

  final ExchangeViewData currentExchange;

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                CoreStrings.of(context)!.receive,
                style: subTitleStyleMediun,
              ),
              Text(
                '${currentExchange.amtReceive.toStringAsFixed(4)} ${currentExchange.toCoin.symbol.toUpperCase()}',
                style: mediumBlackTitle,
              )
            ],
          ),
        ),
      ],
    );
  }
}
