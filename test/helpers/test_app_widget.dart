import 'package:decimal/decimal.dart';
import 'package:everest_crypto/app/data/datasources/api/endpoint_provider.dart';
import 'package:everest_crypto/app/data/datasources/api/endpoints/gencko_endpoints.dart';
import 'package:everest_crypto/app/data/repositories/coin_prices_repository_imp.dart';
import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:everest_crypto/app/domain/usecases/get_coin_prices_usecase.dart';
import 'package:everest_crypto/app/presenter/controllers/notifiers/get_coin_prices_notifier.dart';
import 'package:everest_crypto/app/presenter/controllers/providers/coin_prices_provider.dart';
import 'package:everest_crypto/app/presenter/controllers/providers/get_all_coins_provider.dart';
import 'package:everest_crypto/app/presenter/controllers/providers/get_coins_wallet_provider.dart';
import 'package:everest_crypto/l10n/core_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../data/repositories/coin_prices_repository_test.dart';
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

    // final coinPricesNotifierProviderFake =
    //     StateNotifierProvider<CoinPricesNotifier, List<Decimal>>((ref) {
    //   return CoinPricesNotifier(ref.watch(coinPricesUsecaseProvider));
    // });

    return ProviderScope(
      overrides: [
        // coinPricesNotifierProvider
        //     .overrideWithProvider(coinPricesNotifierProviderFake),
        getAllcoinsNotifierProvider
            .overrideWithProvider(getAllcoinsNotifierProviderFake),
        coinsWalletProvider.overrideWithProvider(coinsWalletProviderFake),
        coinPricesRepositoryProvider
            .overrideWithValue(CoinPricesRepositoryFake())
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

class CoinPricesRepositoryFake implements CoinPricesRepositoryImp {
  @override
  // TODO: implement genkcoEndpoint
  GenckoEndpoints get genkcoEndpoint => throw UnimplementedError();

  @override
  Future<List<Decimal>> getCoinPrices(
      String coinId, String vScurrency, int days) async {
    return [Decimal.parse("1")];
  }
}

Future loadPage(WidgetTester tester, Widget child) async {
  var testAppWidget = TestAppWidget(
    child: child,
  );
  await tester.pumpWidget(testAppWidget);
}

// class CoinPricesNotifierFake extends StateNotifier<List<Decimal>> {
//   final GetCoinPricesUsecaseImp _usecase;
//   CoinPricesNotifierFake(this._usecase) : super([Decimal.parse("1")]);

//   Future<void> getCoinPrices(
//       {required String coinId,
//       required String vScurrency,
//       required int days}) async {
//     state = [Decimal.parse("1")];
//   }
// }
