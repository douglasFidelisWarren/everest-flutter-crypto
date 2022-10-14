import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:everest_crypto/app/presenter/ui/conversion/widgets/amount_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../helpers/fake_repo.dart';
import '../../../../helpers/test_app_widget.dart';

void main() {
  testWidgets(
    """WHEN the value is entered in the AmountFormField field 
    THEN the estimated value text will not be empty""",
    (WidgetTester tester) async {
      FakeRepo repo = FakeRepo();
      CoinViewData fromCoin = repo.getCoin();
      await loadPage(
          tester,
          AmountFormField(
            fromCoin: fromCoin,
          ));
      await tester.enterText(find.byKey(const Key("amountForm")), "1");
      await tester.pumpAndSettle();
      final text =
          tester.widget<Text>(find.byKey(const Key("amountText"))).data!;
      expect(text, equals("R\$\u00A01,00"));
    },
  );
}
