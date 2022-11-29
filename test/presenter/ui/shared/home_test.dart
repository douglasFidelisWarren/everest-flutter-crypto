import 'package:everest_crypto/app/presenter/ui/available/widgets/available_card_coin.dart';
import 'package:everest_crypto/app/presenter/ui/movements/view/movements_page.dart';
import 'package:everest_crypto/app/presenter/ui/portfolio/view/portfolio_page.dart';
import 'package:everest_crypto/app/presenter/ui/shared/custom_bottom_nav_bar.dart';
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
          await loadPage(
              tester,
              const CustomBottomNavBar(
                index: 2,
              ));

          //expect(find.byType(BottomNavigationBarItem), findsOneWidget);
          await tester.pumpAndSettle();

          await tester.tap(find.text("Purchase"));
          await tester.pumpAndSettle();
          expect(find.byType(AvailableCardCoin), findsWidgets);
          await tester.tap(find.text("Portfolio"));
          await tester.pumpAndSettle();
          expect(find.byType(PortfolioPage), findsOneWidget);
          await tester.tap(find.text("Movements"));
          await tester.pumpAndSettle();
          expect(find.byType(MovementsPage), findsOneWidget);
        },
      );
    },
  );
}
