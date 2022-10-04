import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/app_routes.dart';
import 'core/home.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
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
