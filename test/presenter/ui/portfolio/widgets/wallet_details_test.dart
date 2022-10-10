import 'package:decimal/decimal.dart';
import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:everest_crypto/app/presenter/ui/portfolio/widgets/wallet_details.dart';
import 'package:everest_crypto/app/presenter/ui/shared/formater.dart';
import 'package:everest_crypto/app/presenter/ui/shared/styles.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/test_app_widget.dart';

void main() {
  group(
    "WalletDetails test",
    () {
      testWidgets(
        """WHEN Portfolio page has loaded, 
        THEN Text data with key:"totalValue" is equals the sum of the coins in the wallet """,
        (WidgetTester tester) async {
          List<CoinViewData> coins = [
            CoinViewData(
              currentPrice: faker.randomGenerator.decimal(),
              id: faker.guid.toString(),
              image: faker.internet.httpUrl(),
              name: faker.lorem.word(),
              percentage24h: faker.randomGenerator.decimal(),
              symbol: faker.lorem.word(),
              amount: faker.randomGenerator.decimal(),
              amountVsCurrency: faker.randomGenerator.decimal(),
            ),
          ];
          Decimal totalValue = Decimal.parse('0');
          for (var coin in coins) {
            totalValue += Decimal.parse(coin.amountVsCurrency!.toString());
          }
          await loadPage(tester, WalletDetails(coins: coins));
          final totalWallet =
              tester.widget<Text>(find.byKey(const Key("totalValue")));
          expect(totalWallet.data, number.format(totalValue.toDouble()));
        },
      );

      testWidgets("""WHEN the visibility icon is pressed, 
          THEN the icon is equal to visibility_off""",
          (WidgetTester tester) async {
        await loadPage(tester, const WalletDetails(coins: []));
        expect(find.byIcon(Icons.visibility), findsOneWidget);
        await tester.tap(find.byIcon(Icons.visibility));
        await tester.pump();
        expect(find.byIcon(Icons.visibility_off), findsOneWidget);
        expect(find.byIcon(Icons.visibility), findsNothing);
      });

      testWidgets("""WHEN the visibility icon is pressed, 
          THEN the Container with key: "hideValueContainer" color is equal to colorHideOn""",
          (WidgetTester tester) async {
        await loadPage(tester, const WalletDetails(coins: []));
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
