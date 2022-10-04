import 'package:everest_crypto/app/presenter/ui/conversion/conversion_page.dart';
import 'package:everest_crypto/app/presenter/ui/review/view/review_page.dart';

import '../app/presenter/ui/conversion/success_page.dart';
import 'home.dart';
import '../app/presenter/ui/details/view/details_page.dart';
import '../app/presenter/ui/movements/view/movements_page.dart';
import '../app/presenter/ui/portfolio/view/portfolio_page.dart';

var appRoutes = {
  Home.route: (context) => const Home(),
  PortfolioPage.route: (context) => const PortfolioPage(),
  MovementsPage.route: (context) => const MovementsPage(),
  DetailsPage.route: (context) => const DetailsPage(),
  ConversionPage.route: (context) => const ConversionPage(),
  ReviewPage.route: (context) => const ReviewPage(),
  SuccessPage.route: (context) => const SuccessPage(),
};
