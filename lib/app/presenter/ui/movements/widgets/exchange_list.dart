import 'package:flutter/material.dart';

import '../../../../domain/entities/exchange_entity.dart';
import 'movements_details_row.dart';

class ExchangeList extends StatelessWidget {
  const ExchangeList({
    Key? key,
    required this.exchangeList,
  }) : super(key: key);

  final List<ExchangeEntity> exchangeList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: exchangeList.reversed.length,
      itemBuilder: (context, index) {
        ExchangeEntity exchange = exchangeList[index];

        return MovementDetailsRow(
          exchange: exchange,
        );
      },
    );
  }
}
