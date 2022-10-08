import 'package:everest_crypto/app/domain/entities/exchange_entity.dart';
import 'package:everest_crypto/app/presenter/ui/movements/view/movements_page.dart';
import 'package:everest_crypto/app/presenter/ui/movements/widgets/exchange_list.dart';
import 'package:everest_crypto/app/presenter/ui/movements/widgets/movements_details_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/fake_repo.dart';
import '../../../../helpers/test_app_widget.dart';

void main() {
  Future<void> loadPage(WidgetTester tester,
      {required List<ExchangeEntity> exchangeList}) async {
    var exchangeListWidget = TestAppWidget(
      child: ExchangeList(exchangeList: exchangeList),
    );
    await tester.pumpWidget(exchangeListWidget);
  }

  testWidgets(
    "WHEN crypto datails is loaded, THEN crypto infos is equal the info from api crypto",
    (WidgetTester tester) async {
      FakeRepo repo = FakeRepo();
      List<ExchangeEntity> exchangeList = repo.getExchangeList();
      await loadPage(tester, exchangeList: exchangeList);
      await tester.pumpAndSettle();

      //expect(find.byType(ListView), findsOneWidget);

      // final movementDetailsRow =
      //     tester.widget<Padding>(find.byKey(const Key('notExchangesTitle')));
      expect(find.byType(MovementDetailsRow), findsWidgets);

      // final exchangeDate = tester
      //     .widget<Text>(find.byKey(const Key("notExchangesSubTitle")));
      // expect(exchangeDate.data, "You don't have any moves yet...");
    },
  );
}
