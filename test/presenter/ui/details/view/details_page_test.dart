import 'package:everest_crypto/app/domain/entities/chart_config_entity.dart';
import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:everest_crypto/app/domain/entities/exchange_entity.dart';
import 'package:everest_crypto/app/presenter/ui/details/view/details_page.dart';
import 'package:everest_crypto/app/presenter/ui/details/widgets/line_chart_coin.dart';
import 'package:everest_crypto/app/presenter/ui/movements/view/movements_page.dart';
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
    "WHEN crypto datails is loaded, THEN crypto infos is equal the info from api crypto",
    (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        FakeRepo repo = FakeRepo();
        CoinViewData coin = repo.getCoin();
        ChartConfigViewData config = repo.getChartConfig();
        await loadPage(tester, coin: coin, config: config);

        final scroll = tester
            .widget<SingleChildScrollView>(find.byType(SingleChildScrollView));
        expect(scroll.scrollDirection, Axis.vertical);

        //expect(find.byType(Scaffold), findsOneWidget);
      });
    },
  );
}
