import 'package:everest_crypto/app/presenter/ui/details/view/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/presenter/controllers/providers/get_coins_wallet_provider.dart';
import 'core/app_routes.dart';
import 'core/home.dart';
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
        routes: appRoutes,
      ),
    ),
  );
}
