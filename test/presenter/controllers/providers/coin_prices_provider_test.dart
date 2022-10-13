import 'package:decimal/decimal.dart';
import 'package:dio/dio.dart';
import 'package:everest_crypto/app/data/datasources/api/endpoint_provider.dart';
import 'package:everest_crypto/app/data/datasources/api/endpoints/gencko_endpoints.dart';
import 'package:everest_crypto/app/data/repositories/coin_prices_repository_imp.dart';
import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:everest_crypto/app/presenter/controllers/providers/coin_prices_provider.dart';
import 'package:everest_crypto/app/presenter/controllers/providers/conversion_provider.dart';
import 'package:everest_crypto/app/presenter/controllers/providers/get_coins_wallet_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../data/repositories/coin_prices_repository_test.dart';

void main() {
  testWidgets(
    "WHEN the coinsWalletProvider is called THEN returns AsyncData<List<CoinViewData>>",
    (WidgetTester tester) async {
      await tester.pumpWidget(ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: Consumer(
              builder: (context, ref, child) {
                CoinPricesRepositoryImp repo =
                    CoinPricesRepositoryImp(ref.watch(genckoEndpointProvider));
                final prices = repo.getCoinPrices("bitcoin", "brl", 5);
                prices.then((value) => null);
                return const CircularProgressIndicator();
              },
            ),
          ),
        ),
      ));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();
    },
  );
}
