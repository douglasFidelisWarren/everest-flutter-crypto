import 'package:everest_crypto/app/presenter/ui/conversion/view/conversion_page.dart';
import 'package:everest_crypto/l10n/core_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/coins_view_data.dart';
import '../../controllers/providers/get_all_coins_provider.dart';
import '../../controllers/providers/get_coins_wallet_provider.dart';
import '../available/view/available_page.dart';
import '../movements/view/movements_page.dart';
import '../portfolio/view/portfolio_page.dart';
import 'assets.dart';
import 'styles.dart';

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
    List<CoinViewData> getWalletCoins() {
      List<CoinViewData> coins = [];
      List<CoinViewData> coinsProvider =
          ref.watch(coinsWalletProvider).value ?? [];
      for (var coin in coinsProvider) {
        coins.add(coin);
      }
      return coins;
    }

    final walletCoins = getWalletCoins();

    List<CoinViewData> getAvailableCoins() {
      List<CoinViewData> coins = [];
      List<CoinViewData> coinsProvider =
          ref.watch(getAllcoinsNotifierProvider).value ?? [];
      for (var coin in coinsProvider) {
        coins.add(coin);
      }
      return coins;
    }

    final availableCoins = getAvailableCoins();

    return Scaffold(
      body: PageView(
          onPageChanged: setCurrentPage,
          controller: ref.watch(pageControllerProvider),
          children: [
            PortfolioPage(),
            AvailablePage(coins: availableCoins),
            const MovementsPage(),
          ]),
      // bottomNavigationBar: CustomBottomNavBar(index: ref.watch(currentPage.),),
    );
  }
}

class CustomBottomNavBar extends ConsumerWidget {
  const CustomBottomNavBar({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PageController pageController = ref.watch(pageControllerProvider);
    return BottomNavigationBar(
      selectedItemColor: colorBlackText,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
      backgroundColor: Colors.white,
      onTap: (index) {
        ref.read(currentPageProvider.state).state = index;
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
