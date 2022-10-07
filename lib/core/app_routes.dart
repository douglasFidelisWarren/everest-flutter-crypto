import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:everest_crypto/app/presenter/ui/conversion/conversion_page.dart';
import 'package:everest_crypto/app/presenter/ui/review/view/review_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app/presenter/controllers/providers/get_coins_wallet_provider.dart';
import '../app/presenter/ui/conversion/success_page.dart';
import 'home.dart';
import '../app/presenter/ui/details/view/details_page.dart';
import '../app/presenter/ui/movements/view/movements_page.dart';
import '../app/presenter/ui/portfolio/view/portfolio_page.dart';

final coinlistProvider = Provider<List<CoinViewData>>(
    (ref) => ref.watch(coinsWalletProvider).value!);
final coinlist = coinlistProvider as List<CoinViewData>;

var appRoutes = {
  Home.route: (context) => const Home(),
  PortfolioPage.route: (context) => PortfolioPage(coins: coinlist),
  MovementsPage.route: (context) => const MovementsPage(),
  DetailsPage.route: (context) => const DetailsPage(),
  ConversionPage.route: (context) => const ConversionPage(),
  ReviewPage.route: (context) => const ReviewPage(),
  SuccessPage.route: (context) => const SuccessPage(),
};
