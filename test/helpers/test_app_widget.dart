import 'package:decimal/decimal.dart';
import 'package:dio/dio.dart';
import 'package:everest_crypto/app/data/datasources/api/endpoint_provider.dart';
import 'package:everest_crypto/app/data/datasources/api/endpoints/gencko_endpoints.dart';
import 'package:everest_crypto/app/data/repositories/coin_prices_repository_imp.dart';
import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:everest_crypto/app/domain/usecases/get_coin_prices_usecase.dart';
import 'package:everest_crypto/app/presenter/controllers/notifiers/get_coin_prices_notifier.dart';
import 'package:everest_crypto/app/presenter/controllers/providers/coin_prices_provider.dart';
import 'package:everest_crypto/app/presenter/controllers/providers/get_all_coins_provider.dart';
import 'package:everest_crypto/app/presenter/controllers/providers/get_coins_wallet_provider.dart';
import 'package:everest_crypto/app/presenter/controllers/providers/providers.dart';
import 'package:everest_crypto/app/presenter/ui/details/widgets/line_chart_coin.dart';
import 'package:everest_crypto/app/presenter/ui/shared/app_routes.dart';
import 'package:everest_crypto/app/presenter/ui/shared/home.dart';
import 'package:everest_crypto/l10n/core_strings.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../data/datasources/api/endpoints/gencko_endpoints_test.dart';
import '../presenter/ui/review/widgets/confirmation_button_test.dart';
import 'api_factory.dart';
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

    final detailCoinProviderFake = StateProvider(
      (ref) => CoinViewData(
          amount: Decimal.parse("0"),
          amountVsCurrency: Decimal.parse("0"),
          id: "id",
          name: "name",
          symbol: "symbol",
          image: "image",
          currentPrice: Decimal.parse("0"),
          percentage24h: 0),
    );

    final selectedProviderFake = StateProvider<int>((ref) => 5);

//     final coinPricesUsecaseProviderFake = Provider((ref) {
//   return repo.getPrices();
// });
// final genckoEndpointProvider = Provider((ref) {
//   final dio = Dio(BaseOptions(
//     baseUrl: 'https://api.coingecko.com/api/v3',
//   ));
//   return GenckoEndpoints(dio);
// });

    late Response<List<Map<String, dynamic>>> sucess;
    late DioMock dioMock;
    late GenckoEndpoints genckoEndpoints;

    // When mockGetResponse() => when(() =>
    //     dioMock.get(any(), queryParameters: any(named: 'queryParameters')));

    // mockResponse(List<Map<String, dynamic>> factory, int statusCode) =>
    //     Response(
    //         data: factory,
    //         statusCode: statusCode,
    //         requestOptions: RequestOptions(path: faker.internet.httpUrl()));

    // setUp(() {
    //   dioMock = DioMock();
    //   genckoEndpoints = GenckoEndpoints(dioMock);
    // });

    // setUp(() {
    //   sucess = mockResponse(ApiFactory.getCoinsWallet(), 200);
    // });

    // setUp(() {
    //   dioMock = DioMock();
    //   genckoEndpoints = GenckoEndpoints(dioMock);
    // });

    final genckoEndpointProviderFake = Provider((ref) {
      final dio = DioMock();
      return GenckoEndpoints(dio);
    });

    final coinPricesRepositoryProviderFake = Provider((ref) {
      return CoinPricesRepositoryImp(ref.watch(genckoEndpointProviderFake));
    });

    final coinPricesUsecaseProviderFake = Provider((ref) {
      return GetCoinPricesUsecaseImp(
          ref.watch(coinPricesRepositoryProviderFake));
    });

    final coinPricesNotifierProviderFake =
        StateNotifierProvider<CoinPricesNotifier, List<Decimal>>((ref) {
      return CoinPricesNotifier(ref.watch(coinPricesUsecaseProviderFake));
    });

    return ProviderScope(
      overrides: [
        getAllcoinsNotifierProvider
            .overrideWithProvider(getAllcoinsNotifierProviderFake),
        coinsWalletProvider.overrideWithProvider(coinsWalletProviderFake),
        //   detailCoinProvider.overrideWithProvider(detailCoinProviderFake),
        //   selectedProvider.overrideWithProvider(selectedProviderFake),
        //   coinPricesNotifierProvider
        //       .overrideWithProvider(coinPricesNotifierProviderFake),
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
