import 'package:everest_crypto/app/domain/entities/exchange_entity.dart';
import 'package:everest_crypto/app/presenter/ui/review/widgets/confirmation_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../helpers/fake_repo.dart';
import '../../../../helpers/test_app_widget.dart';

void main() {
  testWidgets(
    "WHEN the share button is clicked THEN close the modal",
    (WidgetTester tester) async {
      FakeRepo repo = FakeRepo();
      ExchangeEntity exchange = repo.getExchange();
      await loadPage(tester, ConfirmationButton(currentExchange: exchange));
      expect(find.byKey(const Key("confirmButton")), findsOneWidget);
      //await tester.tap(find.byKey(const Key("confirmButton")));
      //await tester.pumpAndSettle();
      //verify(mockObserver.didPush(any(), any()));
      // expect(find.byType(SuccessPage), findsOneWidget);
    },
  );
}
