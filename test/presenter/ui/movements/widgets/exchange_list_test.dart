import 'package:everest_crypto/app/domain/entities/exchange_entity.dart';
import 'package:everest_crypto/app/presenter/ui/movements/widgets/exchange_list.dart';
import 'package:everest_crypto/app/presenter/ui/movements/widgets/movements_details_row.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/fake_repo.dart';
import '../../../../helpers/test_app_widget.dart';

void main() {
  testWidgets(
    "WHEN the exchange list is called THEN displays the list of exchanges done",
    (WidgetTester tester) async {
      FakeRepo repo = FakeRepo();
      List<ExchangeEntity> exchangeList = repo.getExchangeList();
      await loadPage(tester, ExchangeList(exchangeList: exchangeList));
      await tester.pumpAndSettle();
      expect(find.byType(MovementDetailsRow), findsWidgets);
    },
  );
}
