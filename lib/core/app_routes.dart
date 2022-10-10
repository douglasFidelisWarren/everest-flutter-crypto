import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:everest_crypto/app/presenter/ui/portfolio/widgets/page_body.dart';
import 'package:everest_crypto/app/presenter/ui/review/view/review_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app/presenter/controllers/providers/providers.dart';
import '../app/presenter/ui/conversion/view/conversion_page.dart';
import '../app/presenter/ui/conversion/view/success_page.dart';
import 'home.dart';
import '../app/presenter/ui/movements/view/movements_page.dart';
import '../app/presenter/ui/portfolio/view/portfolio_page.dart';

// final coinlistProvider = Provider<List<CoinViewData>>(
//     (ref) => ref.watch(coinsWalletProvider).value!);
// final coinlist = coinlistProvider as List<CoinViewData>;

final coinProvider = Provider<CoinViewData>(
  (ref) => ref.watch(detailCoinProvider.state).state,
);
final coin = coinProvider as CoinViewData;

var appRoutes = {
  Home.route: (context) => const Home(),
  PortfolioPage.route: (context) => const PortfolioPage(coins: []),
  MovementsPage.route: (context) => const MovementsPage(),
  //DetailsPage.route: (context) => DetailsPage(coin: coin),
  //ConversionPage.route: (context) => const ConversionPage(),
  ReviewPage.route: (context) => const ReviewPage(),
  SuccessPage.route: (context) => const SuccessPage(),
};
