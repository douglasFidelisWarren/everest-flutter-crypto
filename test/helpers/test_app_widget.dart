import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:everest_crypto/app/presenter/controllers/providers/get_all_coins_provider.dart';
import 'package:everest_crypto/app/presenter/controllers/providers/get_coins_wallet_provider.dart';
import 'package:everest_crypto/l10n/core_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'fake_repo.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class FakeRoute extends Fake implements Route {}

class TestAppWidget extends ConsumerWidget {
  final Widget child;

  const TestAppWidget({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    FakeRepo repo = FakeRepo();

    final getAllcoinsNotifierProviderFake = FutureProvider<List<CoinViewData>>(
      (ref) async {
        return repo.getCoinList();
      },
    );

    final coinsWalletProviderFake = FutureProvider<List<CoinViewData>>(
      (ref) async {
        return repo.getCoinList();
      },
    );

    return ProviderScope(
      overrides: [
        getAllcoinsNotifierProvider
            .overrideWithProvider(getAllcoinsNotifierProviderFake),
        coinsWalletProvider.overrideWithProvider(coinsWalletProviderFake),
      ],
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

Future loadPage(WidgetTester tester, Widget child) async {
  var testAppWidget = TestAppWidget(
    child: child,
  );
  await tester.pumpWidget(testAppWidget);
}
