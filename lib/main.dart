import 'package:everest_crypto/app/presenter/ui/portfolio/view/portfolio_page.dart';
import 'package:everest_crypto/app/presenter/ui/shared/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        onGenerateRoute: AppRoutes.generateRoute,
        initialRoute: PortfolioPage.route,
      ),
    ),
  );
}
