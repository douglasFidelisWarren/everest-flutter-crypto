import 'package:everest_crypto/app/domain/entities/exchange_entity.dart';
import 'package:everest_crypto/app/presenter/ui/movements/widgets/modal_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../helpers/fake_repo.dart';
import '../../../../helpers/test_app_widget.dart';

void main() {
  Future<void> loadPage(WidgetTester tester,
      {required ExchangeEntity exchange}) async {
    var modalBody = TestAppWidget(
      child: ModalBody(exchange: exchange),
    );
    await tester.pumpWidget(modalBody);
  }

  testWidgets(
    "WHEN the share button is clicked THEN close the modal",
    (WidgetTester tester) async {
      FakeRepo repo = FakeRepo();
      ExchangeEntity exchange = repo.getExchange();
      await loadPage(tester, exchange: exchange);
      await tester.tap(find.byKey(const Key("closeModal")));
      await tester.pumpAndSettle();
      expect(find.byType(ModalBody), findsNothing);
    },
  );
}
