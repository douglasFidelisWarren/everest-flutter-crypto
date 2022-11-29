import 'package:everest_crypto/app/presenter/ui/conversion/view/success_page.dart';
import 'package:everest_crypto/app/presenter/ui/review/view/review_page.dart';
import 'package:flutter/material.dart';

import '../available/view/available_page.dart';
import '../movements/view/movements_page.dart';
import '../portfolio/view/portfolio_page.dart';

class AppRoutes {
  static Route<dynamic>? generateRoute(settings) {
    if (settings.name == PortfolioPage.route) {
      return PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) =>
            const PortfolioPage(),
      );
    } else if (settings.name == AvailablePage.route) {
      return PageRouteBuilder(
          pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) =>
              const AvailablePage(
                coins: [],
              ));
    } else if (settings.name == MovementsPage.route) {
      return PageRouteBuilder(
          pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) =>
              const MovementsPage());
    } else if (settings.name == ReviewPage.route) {
      return PageRouteBuilder(
          pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) =>
              const ReviewPage());
    } else if (settings.name == SuccessPage.route) {
      return PageRouteBuilder(
          pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) =>
              const SuccessPage());
    }
    return null;
  }
}
