import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:everest_crypto/app/presenter/ui/portfolio/widgets/coin_details.dart';
import 'package:everest_crypto/app/presenter/ui/portfolio/widgets/page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../shared/fake_repo.dart';
import '../../test_app_widget.dart';

void main() {
  Future<void> loadPage(WidgetTester tester,
      {required List<CoinViewData> coinList}) async {
    var pageBody = TestAppWidget(
      child: PageBody(
        coins: coinList,
      ),
    );
    await tester.pumpWidget(pageBody);
  }

  testWidgets("description", (WidgetTester tester) async {
    mockNetworkImagesFor(
      () async {
        FakeRepo repo = FakeRepo();
        List<CoinViewData> coinList = repo.getCoinList();
        await loadPage(tester, coinList: coinList);
        await tester.pumpAndSettle();

        expect(find.byType(CoinDetails), findsOneWidget);
      },
    );
  });
}
