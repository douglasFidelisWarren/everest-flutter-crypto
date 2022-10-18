import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/coins_view_data.dart';
import '../../controllers/providers/get_all_coins_provider.dart';
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
    }
    return null;
  }
}
