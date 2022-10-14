import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:everest_crypto/app/presenter/ui/portfolio/widgets/coin_details.dart';
import 'package:everest_crypto/app/presenter/ui/portfolio/widgets/page_body.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../../helpers/fake_repo.dart';
import '../../../../helpers/test_app_widget.dart';

void main() {
  testWidgets("WHEN PageBody is called THEN display portfolio body page ",
      (WidgetTester tester) async {
    mockNetworkImagesFor(
      () async {
        FakeRepo repo = FakeRepo();
        List<CoinViewData> coinList = [repo.getCoin()];
        await loadPage(tester, PageBody(coins: coinList));
        await tester.pumpAndSettle();
        expect(find.byType(CoinDetails), findsWidgets);
      },
    );
  });
}
