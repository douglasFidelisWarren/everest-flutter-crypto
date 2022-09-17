import 'home.dart';
import '../features/details/presenter/views/details_page.dart';
import '../features/movements/view/movements_page.dart';
import '../features/portfolio/view/portfolio_page.dart';

var appRoutes = {
  Home.route: (context) => const Home(),
  PortfolioPage.route: (context) => const PortfolioPage(),
  MovementsPage.route: (context) => const MovementsPage(),
  DetailsPage.route: (context) => const DetailsPage(),
};
