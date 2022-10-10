import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:everest_crypto/app/presenter/ui/conversion/view/conversion_page.dart';
import 'package:everest_crypto/app/presenter/ui/conversion/widgets/amount_form_field.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../../helpers/fake_repo.dart';
import '../../../../helpers/test_app_widget.dart';

void main() {
  Future<void> loadPage(
    WidgetTester tester, {
    required CoinViewData fromCoin,
  }) async {
    var conversionPage = TestAppWidget(
      child: ConversionPage(
        fromCoin: fromCoin,
      ),
    );
    await tester.pumpWidget(conversionPage);
  }

  testWidgets(
    "WHEN the conversion page loads, THEN display the value form",
    (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        FakeRepo repo = FakeRepo();
        CoinViewData coin = repo.getCoin();
        await loadPage(tester, fromCoin: coin);
        await tester.pumpAndSettle();
        expect(find.byType(AmoutFormField), findsOneWidget);
      });
    },
  );
}
