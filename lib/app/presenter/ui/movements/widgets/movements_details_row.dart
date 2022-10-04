import 'dart:math';

import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../domain/entities/exchange_entity.dart';
import '../../shared/formater.dart';
import '../../shared/styles.dart';
import 'modal_body.dart';

class MovementDetailsRow extends StatelessWidget {
  const MovementDetailsRow({
    Key? key,
    required this.exchange,
    required this.date,
    required this.value,
  }) : super(key: key);

  final ExchangeEntity exchange;
  final DateFormat date;
  final Decimal value;

  @override
  Widget build(BuildContext context) {
    String fromCoinSymbol = exchange.fromCoin.symbol.toUpperCase();
    String toCoinSymbol = exchange.fromCoin.symbol.toUpperCase();
    return MaterialButton(
      onPressed: () => showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            topLeft: Radius.circular(25),
          ),
        ),
        context: context,
        builder: (context) {
          final date = DateFormat('dd/MM/yyyy HH:MM:ss');
          Random rdm = Random();
          int docNumber = rdm.nextInt(9999999);

          return ModalBody(
            docNumber: docNumber,
            date: date,
            exchange: exchange,
          );
        },
      ),
      child: Column(
        children: [
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${exchange.amtConvert} $fromCoinSymbol",
                    style: subTitleStyleMediun,
                  ),
                  Text(
                    date.format(exchange.date),
                    style: smallGraySubTitle,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${exchange.amtReceive.toStringAsFixed(6)} $toCoinSymbol",
                    style: mediumBlackTitle,
                  ),
                  Text(number.format(value.toDouble()),
                      style: smallGraySubTitle),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
