import 'home.dart';
import '../details/view/details_page.dart';
import '../movements/view/movements_page.dart';
import '../portfolio/view/portfolio_page.dart';

var appRoutes = {
  Home.route: (context) => const Home(),
  PortfolioPage.route: (context) => const PortfolioPage(),
  MovementsPage.route: (context) => const MovementsPage(),
  DetailsPage.route: (context) => const DetailsPage(),
};
