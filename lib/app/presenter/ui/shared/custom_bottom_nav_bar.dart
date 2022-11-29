import 'package:everest_crypto/l10n/core_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../available/view/available_page.dart';
import '../movements/view/movements_page.dart';
import '../portfolio/view/portfolio_page.dart';
import 'assets.dart';
import 'styles.dart';

class CustomBottomNavBar extends ConsumerWidget {
  const CustomBottomNavBar({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomNavigationBar(
      selectedItemColor: colorBlackText,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
      backgroundColor: Colors.white,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.popAndPushNamed(
              context,
              PortfolioPage.route,
            );
            break;
          case 1:
            Navigator.popAndPushNamed(
              context,
              AvailablePage.route,
            );
            break;
          case 2:
            Navigator.popAndPushNamed(
              context,
              MovementsPage.route,
            );
            break;
        }
      },
      currentIndex: index,
      items: [
        BottomNavigationBarItem(
          label: CoreStrings.of(context)!.portfolio,
          icon: portfolioIcon,
          activeIcon: portfolioActiveIcon,
        ),
        BottomNavigationBarItem(
          label: CoreStrings.of(context)!.purchase,
          icon: accountIcon,
          activeIcon: accountActiveIcon,
        ),
        BottomNavigationBarItem(
          label: CoreStrings.of(context)!.movementsTitle,
          icon: movementsIcon,
          activeIcon: movementsActiveIcon,
        ),
      ],
    );
  }
}
