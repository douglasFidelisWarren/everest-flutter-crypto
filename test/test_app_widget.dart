import 'package:everest_crypto/l10n/core_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TestAppWidget extends StatelessWidget {
  final Widget child;
  const TestAppWidget({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home: Material(
          child: MediaQuery(
            data: const MediaQueryData(),
            child: child,
          ),
        ),
        supportedLocales: CoreStrings.supportedLocales,
        localizationsDelegates: const [
          CoreStrings.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
      ),
    );
  }
}
