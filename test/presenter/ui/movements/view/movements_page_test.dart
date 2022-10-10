import 'package:everest_crypto/app/presenter/ui/movements/view/movements_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/test_app_widget.dart';

void main() {
  testWidgets(
    """WHEN the movements page loads and there are no movements 
       THEN displays the message of no movements""",
    (WidgetTester tester) async {
      await loadPage(tester, const MovementsPage());
      final exchangeDate =
          tester.widget<Text>(find.byKey(const Key("notExchangesSubTitle")));
      expect(exchangeDate.data, "You don't have any moves yet...");
    },
  );
}
