import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:everest_crypto/app/presenter/ui/portfolio/view/portfolio_page.dart';
import 'package:everest_crypto/app/presenter/ui/portfolio/widgets/page_body.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../../helpers/fake_repo.dart';
import '../../../../helpers/test_app_widget.dart';

void main() {
  testWidgets("""WHEN the portfolio page loads, 
         THEN display the  page body with the  user crypto list """,
      (WidgetTester tester) async {
    mockNetworkImagesFor(
      () async {
        FakeRepo repo = FakeRepo();
        List<CoinViewData> coinList = [repo.getCoin()];
        await loadPage(tester, PortfolioPage());
        await tester.pumpAndSettle();
        expect(find.byType(PageBody), findsOneWidget);
      },
    );
  });
}
