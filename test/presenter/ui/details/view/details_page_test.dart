import 'package:everest_crypto/app/domain/entities/chart_config_entity.dart';
import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:everest_crypto/app/presenter/ui/details/view/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../../helpers/fake_repo.dart';
import '../../../../helpers/test_app_widget.dart';

void main() {
  Future<void> loadPage(WidgetTester tester,
      {required CoinViewData coin, required ChartConfigViewData config}) async {
    var detailsPage = TestAppWidget(
      child: DetailsPage(
        coin: coin,
        config: config,
      ),
    );
    await tester.pumpWidget(detailsPage);
  }

  testWidgets(
    "WHEN the details page loads, THEN display the body page with the crypto details",
    (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        FakeRepo repo = FakeRepo();
        CoinViewData coin = repo.getCoin();
        ChartConfigViewData config = repo.getChartConfig();
        await loadPage(tester, coin: coin, config: config);
        final scroll = tester
            .widget<SingleChildScrollView>(find.byKey(const Key("bodyScroll")));
        expect(scroll.scrollDirection, Axis.vertical);
      });
    },
  );
}
