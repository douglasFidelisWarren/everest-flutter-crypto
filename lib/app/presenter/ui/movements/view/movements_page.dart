import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../domain/entities/exchange_entity.dart';
import '../../../controllers/providers/conversion_provider.dart';
import '../../shared/styles.dart';
import '../widgets/movements_details_row.dart';

class MovementsPage extends ConsumerWidget {
  const MovementsPage({Key? key}) : super(key: key);

  static const route = '/movements';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ExchangeEntity> exchangeList = ref.watch(exchangesListProvider);

    return SafeArea(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 18.0, left: 10),
            child: Text(
              'Movimentações',
              style: mediumBlackTitle1,
            ),
          ),
          Expanded(
            child: Visibility(
              visible: exchangeList.isNotEmpty,
              replacement: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Ops...',
                      style: mediumBlackTitle1,
                    ),
                    Text(
                      'Você ainda não pussui nenhuma movimentação...',
                      style: smallGraySubTitle,
                    ),
                  ],
                ),
              ),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: exchangeList.reversed.length,
                itemBuilder: (context, index) {
                  ExchangeEntity exchange = exchangeList[index];
                  final date = DateFormat('dd/MM/yyyy');
                  final value =
                      exchange.amtReceive * exchange.toCoin.currentPrice;
                  return Padding(
                    padding: const EdgeInsets.all(0),
                    child: MovementDetailsRow(
                      exchange: exchange,
                      date: date,
                      value: value,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      )),
    );
  }
}