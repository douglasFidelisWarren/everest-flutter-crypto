import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:everest_crypto/app/presenter/ui/review/view/review_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app/presenter/controllers/providers/providers.dart';
import '../app/presenter/ui/conversion/view/success_page.dart';
import 'home.dart';
import '../app/presenter/ui/movements/view/movements_page.dart';
import '../app/presenter/ui/portfolio/view/portfolio_page.dart';

final coinProvider = Provider<CoinViewData>(
  (ref) => ref.watch(detailCoinProvider.state).state,
);
final coin = coinProvider as CoinViewData;

var appRoutes = {
  Home.route: (context) => const Home(),
  PortfolioPage.route: (context) => const PortfolioPage(coins: []),
  MovementsPage.route: (context) => const MovementsPage(),
  ReviewPage.route: (context) => const ReviewPage(),
  SuccessPage.route: (context) => const SuccessPage(),
};
