import 'package:decimal/decimal.dart';
import 'package:everest_crypto/app/domain/entities/exchange_entity.dart';
import 'package:everest_crypto/app/presenter/controllers/providers/conversion_provider.dart';
import 'package:everest_crypto/l10n/core_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/fake_repo.dart';

void main() {
  testWidgets(
    "WHEN the convertCoinProvider is called THEN returns ConvertCoinUsecaseImp",
    (WidgetTester tester) async {
      await tester.pumpWidget(ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: Consumer(
              builder: (context, ref, child) {
                FakeRepo repo = FakeRepo();
                final convertCoin = ref.watch(convertCoinProvider);
                ExchangeViewData exchange = convertCoin.convertCoin(
                  fromCoin: repo.getCoin(),
                  toCoin: repo.getCoin(),
                  amtConvert: Decimal.parse("1"),
                );
                if (exchange.amtConvert.toDouble() > 0) {
                  return const CircularProgressIndicator();
                }
                return Text(CoreStrings.of(context)!.portfolio);
              },
            ),
          ),
        ),
      ));
      await tester.pump();
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(Text), findsNothing);
    },
  );
}
