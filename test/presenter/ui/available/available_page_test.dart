import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:everest_crypto/app/presenter/ui/available/view/available_page.dart';
import 'package:everest_crypto/app/presenter/ui/available/widgets/available_card_coin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../helpers/fake_repo.dart';
import '../../../helpers/test_app_widget.dart';

void main() {
  Future<void> loadPage(WidgetTester tester,
      {required List<CoinViewData> coinList}) async {
    var availablePage = TestAppWidget(
      child: AvailablePage(
        coins: coinList,
      ),
    );
    await tester.pumpWidget(availablePage);
  }

  testWidgets(
      "WHEN the available page loads, THEN display the available coins ",
      (WidgetTester tester) async {
    mockNetworkImagesFor(
      () async {
        FakeRepo repo = FakeRepo();
        List<CoinViewData> coinList = repo.getCoinList();
        await loadPage(tester, coinList: coinList);
        await tester.pumpAndSettle();

        expect(find.byType(AvailableCardCoin), findsWidgets);
      },
    );
  });
}
