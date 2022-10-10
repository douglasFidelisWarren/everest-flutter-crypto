import 'package:everest_crypto/app/domain/entities/exchange_entity.dart';
import 'package:everest_crypto/app/presenter/ui/movements/widgets/modal_body.dart';
import 'package:everest_crypto/app/presenter/ui/movements/widgets/movements_details_row.dart';
import 'package:everest_crypto/app/presenter/ui/shared/formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/fake_repo.dart';
import '../../../../helpers/test_app_widget.dart';

void main() {
  group(
    "Movements details row test",
    () {
      testWidgets(
        "WHEN crypto datails is loaded, THEN crypto infos is equal the info from api crypto",
        (WidgetTester tester) async {
          FakeRepo repo = FakeRepo();
          ExchangeEntity exchange = repo.getExchange();
          await loadPage(tester, MovementDetailsRow(exchange: exchange));
          final value = exchange.amtReceive * exchange.toCoin.currentPrice;

          final exchangeAmount =
              tester.widget<Text>(find.byKey(const Key("exchangeAmount")));
          expect(exchangeAmount.data,
              "${exchange.amtConvert} ${exchange.fromCoin.symbol.toUpperCase()}");

          final exchangeDate =
              tester.widget<Text>(find.byKey(const Key("exchangeDate")));
          expect(exchangeDate.data, date.format(exchange.date));

          final exchangeAmountReceive = tester
              .widget<Text>(find.byKey(const Key("exchangeAmountReceive")));
          expect(exchangeAmountReceive.data,
              "${exchange.amtReceive.toStringAsFixed(6)} ${exchange.fromCoin.symbol.toUpperCase()}");

          final exchangeAmountVScurrencyReceive = tester.widget<Text>(
              find.byKey(const Key("exchangeAmountVScurrencyReceive")));
          expect(exchangeAmountVScurrencyReceive.data,
              number.format(value.toDouble()));
        },
      );
      testWidgets(
        "WHEN the exchange row is clicked THEN display the modal",
        (WidgetTester tester) async {
          FakeRepo repo = FakeRepo();
          ExchangeEntity exchange = repo.getExchange();
          await loadPage(tester, MovementDetailsRow(exchange: exchange));
          await tester.tap(find.byKey(const Key("showModalAccess")));
          await tester.pumpAndSettle();
          expect(find.byType(ModalBody), findsOneWidget);
        },
      );
    },
  );
}
