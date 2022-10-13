import 'package:everest_crypto/app/presenter/controllers/providers/coin_prices_provider.dart';
import 'package:everest_crypto/app/presenter/ui/details/widgets/line_chart_coin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/fake_repo.dart';
import '../../../../helpers/test_app_widget.dart';

void main() {
  testWidgets(
    "desc",
    (WidgetTester tester) async {
      await tester.pumpWidget(ProviderScope(
        overrides: [
          coinPricesRepositoryProvider
              .overrideWithValue(CoinPricesRepositoryFake())
        ],
        child: MaterialApp(
          home: Scaffold(
            body: Consumer(
              builder: (context, ref, child) {
                FakeRepo repo = FakeRepo();

                return LineChartCoin(repo.getCoin());
              },
            ),
          ),
        ),
      ));
      expect(find.byType(LineChartCoin), findsOneWidget);
      await tester.tap(find.byKey(const Key("5")));
      await tester.pumpAndSettle();
    },
  );
}
