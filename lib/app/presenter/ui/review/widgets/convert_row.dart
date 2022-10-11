import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

import '../../../../../l10n/core_strings.dart';
import '../../shared/styles.dart';

class ConvertRow extends StatelessWidget {
  const ConvertRow({
    Key? key,
    required this.amountConvert,
    required this.fromSymbol,
  }) : super(key: key);

  final Decimal amountConvert;
  final String fromSymbol;

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
              Text(CoreStrings.of(context)!.convertTitle,
                  style: subTitleStyleMediun),
              Text('${amountConvert.toStringAsFixed(8)} $fromSymbol',
                  style: mediumBlackTitle)
            ],
          ),
        ),
      ],
    );
  }
}
