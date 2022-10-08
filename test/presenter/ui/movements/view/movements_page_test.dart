import 'package:everest_crypto/app/domain/entities/exchange_entity.dart';
import 'package:everest_crypto/app/presenter/ui/movements/view/movements_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/fake_repo.dart';
import '../../../../helpers/test_app_widget.dart';

void main() {
  Future<void> loadPage(WidgetTester tester,
      {required ExchangeEntity exchange}) async {
    var movementsPage = const TestAppWidget(
      child: MovementsPage(),
    );
    await tester.pumpWidget(movementsPage);
  }

  testWidgets(
    "WHEN crypto datails is loaded, THEN crypto infos is equal the info from api crypto",
    (WidgetTester tester) async {
      FakeRepo repo = FakeRepo();
      ExchangeEntity exchange = repo.getExchange();
      await loadPage(tester, exchange: exchange);

      final notExchangesTitle =
          tester.widget<Text>(find.byKey(const Key('notExchangesTitle')));
      expect(notExchangesTitle.data, "Ops...");

      final exchangeDate =
          tester.widget<Text>(find.byKey(const Key("notExchangesSubTitle")));
      expect(exchangeDate.data, "You don't have any moves yet...");
    },
  );
}
