import 'package:flutter/material.dart';

import '../../../../domain/entities/exchange_entity.dart';
import '../../shared/formater.dart';
import '../../shared/styles.dart';
import 'modal_body.dart';

class MovementDetailsRow extends StatelessWidget {
  const MovementDetailsRow({
    Key? key,
    required this.exchange,
  }) : super(key: key);

  final ExchangeEntity exchange;

  @override
  Widget build(BuildContext context) {
    final value = exchange.amtReceive * exchange.toCoin.currentPrice;
    String fromCoinSymbol = exchange.fromCoin.symbol.toUpperCase();
    String toCoinSymbol = exchange.fromCoin.symbol.toUpperCase();
    return MaterialButton(
      key: const Key("showModalAccess"),
      onPressed: () => showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            topLeft: Radius.circular(25),
          ),
        ),
        context: context,
        builder: (context) {
          return ModalBody(
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
                    key: const Key("exchangeAmount"),
                    "${exchange.amtConvert} $fromCoinSymbol",
                    style: subTitleStyleMediun,
                  ),
                  Text(
                    key: const Key("exchangeDate"),
                    date.format(exchange.date),
                    style: smallGraySubTitle,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    key: const Key("exchangeAmountReceive"),
                    "${exchange.amtReceive.toStringAsFixed(6)} $toCoinSymbol",
                    style: mediumBlackTitle,
                  ),
                  Text(
                      key: const Key("exchangeAmountVScurrencyReceive"),
                      number.format(value.toDouble()),
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
