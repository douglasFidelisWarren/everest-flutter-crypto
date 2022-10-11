import 'package:decimal/decimal.dart';
import 'package:everest_crypto/app/data/repositories/wallet_repository_imp.dart';
import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:everest_crypto/app/domain/entities/exchange_entity.dart';
import 'package:everest_crypto/app/presenter/controllers/providers/conversion_provider.dart';
import 'package:everest_crypto/app/presenter/controllers/providers/get_coins_wallet_provider.dart';
import 'package:everest_crypto/app/presenter/ui/conversion/widgets/amount_form_field.dart';
import 'package:everest_crypto/l10n/core_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../data/repositories/coin_prices_repository_test.dart';
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
      final text = tester
          .widget<Text>(find.byKey(const Key("amountText")))
          .data!
          .replaceAll("R\$", "");
      expect(text, isNotEmpty);
    },
  );
}
