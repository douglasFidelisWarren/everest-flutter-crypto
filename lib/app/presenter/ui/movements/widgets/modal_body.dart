import 'package:everest_crypto/l10n/core_strings.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../domain/entities/exchange_entity.dart';
import '../../shared/formater.dart';
import '../../shared/styles.dart';
import 'info_row.dart';

class ModalBody extends StatelessWidget {
  const ModalBody({
    Key? key,
    required this.docNumber,
    required this.date,
    required this.exchange,
  }) : super(key: key);

  final int docNumber;
  final DateFormat date;
  final ExchangeEntity exchange;

  @override
  Widget build(BuildContext context) {
    String fromCoinSymbol = exchange.fromCoin.symbol.toUpperCase();
    String toCoinSymbol = exchange.fromCoin.symbol.toUpperCase();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 18.0),
          child: Text(
            CoreStrings.of(context)!.movementReceipt,
            style: appBarTextStyle,
          ),
        ),
        InfoRow(
          description: CoreStrings.of(context)!.documentNumber,
          value: docNumber.toString(),
        ),
        InfoRow(
          description: CoreStrings.of(context)!.date,
          value: date.format(exchange.date),
        ),
        InfoRow(
          description:
              '${CoreStrings.of(context)!.debtCoin} - ${exchange.fromCoin.name}',
          value: '- ${exchange.amtConvert.toStringAsFixed(4)} $fromCoinSymbol',
        ),
        InfoRow(
          description:
              '${CoreStrings.of(context)!.creditCoin} - ${exchange.toCoin.name}',
          value: ' ${exchange.amtReceive.toStringAsFixed(6)} $toCoinSymbol',
        ),
        InfoRow(
          description: CoreStrings.of(context)!.movementValue,
          value: number.format(
              (exchange.amtConvert * exchange.fromCoin.currentPrice)
                  .toDouble()),
        ),
        InfoRow(
          description: CoreStrings.of(context)!.rateValue,
          value: number.format(
              (exchange.amtConvert * exchange.fromCoin.currentPrice)
                      .toDouble() *
                  0.002),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            height: 45,
            color: colorBrandWarren,
            minWidth: 600,
            onPressed: () {},
            child: Text(
              CoreStrings.of(context)!.receiptShare,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
