import 'package:everest_crypto/app/data/datasources/api/endpoint_provider.dart';
import 'package:everest_crypto/app/data/repositories/wallet_repository_imp.dart';
import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
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
        overrides: [
          genckoEndpointProvider.overrideWithValue(GenckoEndpointsMock())
        ],
        child: MaterialApp(
          home: Scaffold(
            body: Consumer(
              builder: (context, ref, child) {
                String helper = ref.watch(helpTextProvider);
                final coins = ref.watch(coinsWalletProvider);
                if (coins.asData is AsyncData<List<CoinViewData>>) {
                  return const CircularProgressIndicator();
                }
                return Text(helper);
              },
            ),
          ),
        ),
      ));
      await tester.pump();
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(Text), findsOneWidget);
    },
  );
}
