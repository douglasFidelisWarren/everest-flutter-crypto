import 'package:everest_crypto/l10n/core_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app/presenter/controllers/providers/get_all_coins_provider.dart';
import '../app/presenter/ui/available/view/available_page.dart';
import '../app/presenter/ui/movements/view/movements_page.dart';
import '../app/presenter/ui/portfolio/view/portfolio_page.dart';
import '../app/presenter/ui/shared/assets.dart';
import '../app/presenter/ui/shared/styles.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  static const route = '/';

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  int currentPage = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    ref.read(getAllcoinsNotifierProvider);
    pageController = PageController(initialPage: currentPage);
  }

  setCurrentPage(page) {
    setState(
      () {
        currentPage = page;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          onPageChanged: setCurrentPage,
          controller: pageController,
          children: const [
            PortfolioPage(),
            AvailablePage(),
            MovementsPage(),
          ]),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: colorBlackText,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
        backgroundColor: Colors.white,
        onTap: (page) {
          pageController.animateToPage(page,
              duration: const Duration(milliseconds: 400), curve: Curves.ease);
        },
        currentIndex: currentPage,
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
            label: CoreStrings.of(context)!.movements,
            icon: movementsIcon,
            activeIcon: movementsActiveIcon,
          ),
        ],
      ),
    );
  }
}
