import 'package:everest_crypto/l10n/core_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/l10n_test_widget.dart';

void main() {
  testWidgets(
    "WHEN the locale is unsupported, THEN throw exception",
    (WidgetTester tester) async {
      await tester
          .pumpWidget(const L10nTestWidget(locale: Locale("error", "")));
      await tester.pumpAndSettle();
      expect(() => lookupCoreStrings(const Locale("error", "")),
          throwsFlutterError);
    },
  );
}
