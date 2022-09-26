import '../app/presenter/ui/details/view/details_page.dart';
import '../app/presenter/ui/movements/movements_page.dart';
import '../app/presenter/ui/portfolio/view/portfolio_page.dart';
import 'home.dart';

var appRoutes = {
  Home.route: (context) => const Home(),
  PortfolioPage.route: (context) => const PortfolioPage(),
  MovementsPage.route: (context) => const MovementsPage(),
  DetailsPage.route: (context) => const DetailsPage(),
};
