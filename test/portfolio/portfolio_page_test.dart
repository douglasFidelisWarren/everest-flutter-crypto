import 'package:decimal/decimal.dart';
import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:everest_crypto/app/presenter/ui/portfolio/widgets/wallet_details.dart';
import 'package:everest_crypto/app/presenter/ui/shared/formater.dart';
import 'package:everest_crypto/app/presenter/ui/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_app_widget.dart';

void main() {
  // Future<void> loadPage(WidgetTester tester, Widget child) async {
  //   await tester.pumpWidget(MaterialApp(
  //     home: TestAppWidget(
  //       child: child,
  //     ),
  //   ));
  // }

  group(
    "Portfolio page test",
    () {
      Future<void> loadPage(WidgetTester tester,
          {required List<CoinViewData> coins}) async {
        var walletDetails = TestAppWidget(
          child: WalletDetails(coins: coins),
        );
        await tester.pumpWidget(walletDetails);
      }

      testWidgets(
        """WHEN Portfolio page has loaded, 
        THEN Text data with key:"totalValue" is equals the sum of the coins in the wallet """,
        (WidgetTester tester) async {
          List<CoinViewData> coins = [
            CoinViewData(
                currentPrice: Decimal.parse("100"),
                id: "btc",
                image: "url",
                name: "btc",
                percentage24h: 0,
                symbol: "btc",
                amount: Decimal.parse("2"),
                amountVsCurrency: Decimal.parse("3"))
          ];
          Decimal totalValue = Decimal.parse('0');
          for (var coin in coins) {
            totalValue += coin.amountVsCurrency!;
          }
          await loadPage(tester, coins: coins);
          final totalWallet =
              tester.widget<Text>(find.byKey(const Key("totalValue")));
          expect(totalWallet.data, number.format(totalValue.toDouble()));
        },
      );

      testWidgets("""WHEN the visibility icon is pressed, 
          THEN the icon is equal to visibility_off""",
          (WidgetTester tester) async {
        await loadPage(tester, coins: []);
        expect(find.byIcon(Icons.visibility), findsOneWidget);
        await tester.tap(find.byIcon(Icons.visibility));
        await tester.pump();
        expect(find.byIcon(Icons.visibility_off), findsOneWidget);
        expect(find.byIcon(Icons.visibility), findsNothing);
      });

      testWidgets("""WHEN the visibility icon is pressed, 
          THEN the Container with key: "hideValueContainer" color is equal to colorHideOn""",
          (WidgetTester tester) async {
        await loadPage(tester, coins: []);
        await tester.tap(find.byIcon(Icons.visibility));
        await tester.pump();
        final hideValue = tester
            .widget<Container>(find.byKey(const Key("hideValueContainer")));
        expect(
            hideValue.decoration,
            BoxDecoration(
                color: colorHideOn, borderRadius: BorderRadius.circular(5)));
      });
    },
  );
}
