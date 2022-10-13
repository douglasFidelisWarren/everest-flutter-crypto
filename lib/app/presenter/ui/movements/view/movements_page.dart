import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../l10n/core_strings.dart';
import '../../../../domain/entities/exchange_entity.dart';
import '../../../controllers/providers/conversion_provider.dart';
import '../../shared/styles.dart';
import '../widgets/exchange_list.dart';

class MovementsPage extends ConsumerWidget {
  const MovementsPage({Key? key}) : super(key: key);

  static const route = '/movements';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ExchangeViewData> exchangeList = ref.watch(exchangesListProvider);

    return SafeArea(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0, left: 10),
            child: Text(
              CoreStrings.of(context)!.movementsTitle,
              style: mediumBlackTitle1,
            ),
          ),
          Expanded(
            child: Visibility(
              visible: exchangeList.isNotEmpty,
              replacement: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Ops...',
                      key: Key('notExchangesTitle'),
                      style: mediumBlackTitle1,
                    ),
                    Text(
                      CoreStrings.of(context)!.noMovements,
                      key: const Key('notExchangesSubTitle'),
                      style: smallGraySubTitle,
                    ),
                  ],
                ),
              ),
              child: ExchangeList(exchangeList: exchangeList),
            ),
          ),
        ],
      )),
    );
  }
}
