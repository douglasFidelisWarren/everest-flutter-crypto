import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/presenter/ui/shared/app_routes.dart';
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
        routes: appRoutes,
      ),
    ),
  );
}
