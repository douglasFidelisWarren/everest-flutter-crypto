import 'package:decimal/decimal.dart';
import 'package:dio/dio.dart';
import 'package:everest_crypto/app/data/datasources/api/endpoint_provider.dart';
import 'package:everest_crypto/app/data/datasources/api/endpoints/gencko_endpoints.dart';
import 'package:everest_crypto/app/data/repositories/coin_prices_repository_imp.dart';
import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:everest_crypto/app/domain/usecases/get_coin_prices_usecase.dart';
import 'package:everest_crypto/app/presenter/controllers/notifiers/get_coin_prices_notifier.dart';
import 'package:everest_crypto/app/presenter/controllers/providers/coin_prices_provider.dart';
import 'package:everest_crypto/app/presenter/ui/portfolio/widgets/coin_details.dart';
import 'package:everest_crypto/app/presenter/ui/shared/formater.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../../data/datasources/api/endpoints/gencko_endpoints_test.dart';
import '../../../../helpers/api_factory.dart';
import '../../../../helpers/fake_repo.dart';
import '../../../../helpers/test_app_widget.dart';

void main() {
  testWidgets(
    "WHEN CoinDetails called, THEN crypto infos is equal the info from api crypto",
    (WidgetTester tester) async {
      mockNetworkImagesFor(
        () async {
          FakeRepo repo = FakeRepo();
          CoinViewData coin = repo.getCoin();
          await loadPage(tester, CoinDetails(coin: coin));

          final coinImage =
              tester.widget<Image>(find.byKey(const Key("coinImage")));
          expect(coinImage.image, NetworkImage(coin.image, scale: 5.0));

          final coinName =
              tester.widget<Text>(find.byKey(const Key("coinName")));
          expect(coinName.data, coin.name);

          final coinSymbolTitle =
              tester.widget<Text>(find.byKey(const Key("coinSymbolTitle")));
          expect(coinSymbolTitle.data, coin.symbol.toUpperCase());

          final coinAmountVsCurrency = tester
              .widget<Text>(find.byKey(const Key("coinAmountVsCurrency")));
          expect(coinAmountVsCurrency.data,
              number.format(coin.amountVsCurrency!.toDouble()));

          final coinAmount =
              tester.widget<Text>(find.byKey(const Key("coinAmount")));
          expect(coinAmount.data, coin.amount!.toStringAsFixed(2));

          final coinSymbol =
              tester.widget<Text>(find.byKey(const Key("coinSymbol")));
          expect(coinSymbol.data, coin.symbol.toUpperCase());
        },
      );
    },
  );

  testWidgets(
    "WHEN home is built THEN page view is launched from app",
    (WidgetTester tester) async {
      mockNetworkImagesFor(
        () async {
          FakeRepo repo = FakeRepo();
          CoinViewData coin = repo.getCoin();
          await loadPage(
              tester,
              CoinDetails(
                coin: coin,
              ));

          expect(find.byKey(const Key("detailsPageAccess")), findsOneWidget);
          await tester.pumpAndSettle();

          // await tester.tap(find.byKey(const Key("detailsPageAccess")));
          // await tester.pumpAndSettle();
          // expect(find.byType(AvailableCardCoin), findsWidgets);
        },
      );
    },
  );
  late Response<List<Map<String, dynamic>>> sucess;
  late DioMock dioMock;
  late GenckoEndpoints genckoEndpoints;

  When mockGetResponse() => when(
      () => dioMock.get(any(), queryParameters: any(named: 'queryParameters')));

  mockResponse(List<Map<String, dynamic>> factory, int statusCode) => Response(
      data: factory,
      statusCode: statusCode,
      requestOptions: RequestOptions(path: faker.internet.httpUrl()));

  setUp(() {
    dioMock = DioMock();
    genckoEndpoints = GenckoEndpoints(dioMock);
  });

  setUp(() {
    sucess = mockResponse(ApiFactory.getCoinsWallet(), 200);
  });

  final coinPricesRepositoryProviderFake = Provider((ref) {
    return CoinPricesRepositoryImp(genckoEndpoints);
  });

  final coinPricesUsecaseProviderFake = Provider((ref) {
    return GetCoinPricesUsecaseImp(ref.watch(coinPricesRepositoryProviderFake));
  });
  final coinPricesNotifierProviderFake =
      StateNotifierProvider<CoinPricesNotifier, List<Decimal>>((ref) {
    return CoinPricesNotifier(ref.watch(coinPricesUsecaseProvider));
  });

  // testWidgets(
  //   "WHEN the convertCoinProvider is called THEN returns ConvertCoinUsecaseImp",
  //   (WidgetTester tester) async {
  //     mockNetworkImagesFor(() async {
  //       await tester.pumpWidget(ProviderScope(
  //         overrides: [
  //           coinPricesRepositoryProvider
  //               .overrideWithProvider(coinPricesRepositoryProviderFake),
  //           coinPricesRepositoryProvider
  //               .overrideWithProvider(coinPricesRepositoryProviderFake),
  //           coinPricesUsecaseProvider
  //               .overrideWithProvider(coinPricesUsecaseProviderFake)
  //         ],
  //         child: MaterialApp(
  //           home: Scaffold(
  //             body: Consumer(
  //               builder: (context, ref, child) {
  //                 FakeRepo repo = FakeRepo();
  //                 CoinViewData coin = repo.getCoin();
  //                 return CoinDetails(
  //                   coin: coin,
  //                 );
  //               },
  //             ),
  //           ),
  //         ),
  //       ));
  //       expect(find.byKey(const Key("detailsPageAccess")), findsOneWidget);
  //       await tester.pumpAndSettle();

  //       await tester.tap(find.byKey(const Key("detailsPageAccess")));
  //       await tester.pumpAndSettle();
  //     });
  //   },
  // );
}
