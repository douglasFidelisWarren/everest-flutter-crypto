import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:everest_crypto/app/presenter/ui/portfolio/widgets/coin_details.dart';
import 'package:everest_crypto/app/presenter/ui/shared/formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

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
        },
      );
    },
  );
}
