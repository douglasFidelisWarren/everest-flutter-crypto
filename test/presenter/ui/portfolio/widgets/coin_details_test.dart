import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:everest_crypto/app/presenter/ui/portfolio/widgets/coin_details.dart';
import 'package:everest_crypto/app/presenter/ui/shared/formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../../helpers/fake_repo.dart';
import '../../../../helpers/test_app_widget.dart';

void main() {
  group(
    "CoinDetails test",
    () {
      Future<void> loadPage(
        WidgetTester tester, {
        required CoinViewData coin,
      }) async {
        var coinDetails = TestAppWidget(
          child: CoinDetails(
            coin: coin,
          ),
        );
        await tester.pumpWidget(coinDetails);
      }

      testWidgets(
        "description",
        (WidgetTester tester) async {
          mockNetworkImagesFor(
            () async {
              FakeRepo repo = FakeRepo();
              CoinViewData coin = repo.getCoin();
              await loadPage(tester, coin: coin);

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
        "description2",
        (WidgetTester tester) async {
          mockNetworkImagesFor(
            () async {
              FakeRepo repo = FakeRepo();
              CoinViewData coin = repo.getCoin();
              await loadPage(tester, coin: coin);
              final teste =
                  tester.widget<MaterialButton>(find.byType(MaterialButton));
              expect(find.byWidget(teste), findsOneWidget);
            },
          );
        },
      );
    },
  );
}
