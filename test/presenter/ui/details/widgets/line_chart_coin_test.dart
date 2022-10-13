import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:everest_crypto/app/presenter/ui/details/widgets/line_chart_coin.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../../helpers/fake_repo.dart';
import '../../../../helpers/test_app_widget.dart';

void main() {
  testWidgets(
    "description",
    (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        FakeRepo repo = FakeRepo();
        CoinViewData coin = repo.getCoin();
        await loadPage(tester, LineChartCoin(coin));
        await tester.tap(find.byKey(const Key("5")));
        await tester.pumpAndSettle();

        LineChart teste = tester.widget<LineChart>(find.byType(LineChart));
        expect(find.byType(LineChart), findsOneWidget);
      });
    },
  );
}
