import '../presenter/home/home.dart';
import '../presenter/views/details/details_page.dart';
import '../presenter/views/movements/movements_page.dart';
import '../presenter/views/portfolio/portfolio_page.dart';

var appRoutes = {
  Home.route: (context) => const Home(),
  PortfolioPage.route: (context) => const PortfolioPage(),
  MovementsPage.route: (context) => const MovementsPage(),
  DetailsPage.route: (context) => const DetailsPage(),
};
