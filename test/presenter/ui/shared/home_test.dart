import 'package:everest_crypto/app/presenter/ui/available/widgets/available_card_coin.dart';
import 'package:everest_crypto/app/presenter/ui/shared/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../helpers/test_app_widget.dart';

void main() {
  testWidgets(
    "WHEN home is built THEN page view is launched from app",
    (WidgetTester tester) async {
      mockNetworkImagesFor(
        () async {
          await loadPage(tester, const Home());

          expect(find.byType(PageView), findsOneWidget);
          await tester.pumpAndSettle();

          await tester.tap(find.text("Purchase"));
          await tester.pumpAndSettle();
          expect(find.byType(AvailableCardCoin), findsWidgets);
        },
      );
    },
  );
}
