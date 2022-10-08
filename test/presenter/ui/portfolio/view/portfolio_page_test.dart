import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:everest_crypto/app/presenter/ui/portfolio/view/portfolio_page.dart';
import 'package:everest_crypto/app/presenter/ui/portfolio/widgets/page_body.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../../helpers/fake_repo.dart';
import '../../../../helpers/test_app_widget.dart';

void main() {
  Future<void> loadPage(WidgetTester tester,
      {required List<CoinViewData> coinList}) async {
    var portfolioPage = TestAppWidget(
      child: PortfolioPage(
        coins: coinList,
      ),
    );
    await tester.pumpWidget(portfolioPage);
  }

  testWidgets("description", (WidgetTester tester) async {
    mockNetworkImagesFor(
      () async {
        FakeRepo repo = FakeRepo();
        List<CoinViewData> coinList = repo.getCoinList();
        await loadPage(tester, coinList: coinList);
        await tester.pumpAndSettle();

        expect(find.byType(PageBody), findsOneWidget);
      },
    );
  });
}
