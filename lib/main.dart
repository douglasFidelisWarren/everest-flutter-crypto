import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/presenter/ui/conversion/view/success_page.dart';
import 'app/presenter/ui/movements/view/movements_page.dart';
import 'app/presenter/ui/portfolio/view/portfolio_page.dart';
import 'app/presenter/ui/review/view/review_page.dart';
import 'app/presenter/ui/shared/home.dart';
import 'l10n/core_strings.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        supportedLocales: CoreStrings.supportedLocales,
        localizationsDelegates: const [
          CoreStrings.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        theme: ThemeData(
            colorScheme: const ColorScheme.light(
          primary: Colors.black,
          secondary: Colors.black,
        )),
        debugShowCheckedModeBanner: false,
        initialRoute: Home.route,
        routes: {
          Home.route: (context) => const Home(),
          PortfolioPage.route: (context) => const PortfolioPage(coins: []),
          MovementsPage.route: (context) => const MovementsPage(),
          ReviewPage.route: (context) => const ReviewPage(),
          SuccessPage.route: (context) => const SuccessPage(),
        },
      ),
    ),
  );
}
