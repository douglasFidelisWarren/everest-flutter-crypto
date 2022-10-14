import 'package:everest_crypto/l10n/core_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/l10n_test_widget.dart';

void main() {
  test('WHEN appLocalizations call shouldReload, THEN expect a false value',
      () {
    expect(CoreStrings.delegate.shouldReload.call(CoreStrings.delegate), false);
  });
  testWidgets(
    "WHEN the locale is 'en', THEN all strings are in english",
    (WidgetTester tester) async {
      await tester.pumpWidget(const L10nTestWidget(locale: Locale('en', '')));
      expect(find.text("Crypto"), findsOneWidget);
      expect(find.text("Total value of cryptos"), findsOneWidget);
      expect(find.text("Portfolio"), findsOneWidget);
      expect(find.text("Purchase"), findsOneWidget);
      expect(find.text("Movements"), findsOneWidget);
      expect(find.text("Available crypto"), findsOneWidget);
      expect(find.text("You don't have any moves yet..."), findsOneWidget);
      expect(find.text("Details"), findsOneWidget);
      expect(find.text("Current Price"), findsOneWidget);
      expect(find.text("Variation in "), findsOneWidget);
      expect(find.text("days"), findsOneWidget);
      expect(find.text("Amount"), findsOneWidget);
      expect(find.text("Value"), findsOneWidget);
      expect(find.text("Convert crypto"), findsOneWidget);
      expect(find.text("Balance available"), findsOneWidget);
      expect(find.text("insufficient"), findsOneWidget);
      expect(find.text("How much would you like to convert?"), findsOneWidget);
      expect(find.text("Estimated total"), findsOneWidget);
      expect(find.text("Review"), findsOneWidget);
      expect(find.text("Review your conversion"), findsOneWidget);
      expect(find.text("Convert"), findsOneWidget);
      expect(find.text("Receive"), findsOneWidget);
      expect(find.text("Exchange"), findsOneWidget);
      expect(find.text("Successful"), findsOneWidget);
      expect(find.text("Movements"), findsOneWidget);
      expect(find.text("Currency conversion successful!"), findsOneWidget);
      expect(find.text("Movement receipt"), findsOneWidget);
      expect(find.text("Document number"), findsOneWidget);
      expect(find.text("Debt"), findsOneWidget);
      expect(find.text("Credit"), findsOneWidget);
      expect(find.text("Movement value"), findsOneWidget);
      expect(find.text("Rate value"), findsOneWidget);
      expect(find.text("Receipt share"), findsOneWidget);
    },
  );
}
