import 'package:everest_crypto/app/presenter/controllers/providers/get_all_coins_provider.dart';
import 'package:everest_crypto/app/presenter/controllers/providers/get_coins_wallet_provider.dart';
import 'package:everest_crypto/app/presenter/controllers/providers/providers.dart';
import 'package:everest_crypto/app/presenter/ui/shared/app_routes.dart';
import 'package:everest_crypto/app/presenter/ui/shared/custom_bottom_nav_bar.dart';
import 'package:everest_crypto/l10n/core_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'fake_repo.dart';

class TestAppWidget extends ConsumerWidget {
  final Widget child;

  const TestAppWidget({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [
        coinsWalletProvider.overrideWithProvider(coinsWalletProviderFake),
        getAllcoinsNotifierProvider
            .overrideWithProvider(getAllcoinsNotifierProviderFake)
      ],
      child: MaterialApp(
        onGenerateRoute: AppRoutes.generateRoute,
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

Future loadPage(WidgetTester tester, Widget child) async {
  var testAppWidget = TestAppWidget(
    child: child,
  );
  await tester.pumpWidget(testAppWidget);
}
