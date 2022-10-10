import 'package:everest_crypto/app/domain/entities/exchange_entity.dart';
import 'package:everest_crypto/app/presenter/ui/review/view/review_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../../helpers/fake_repo.dart';
import '../../../../helpers/test_app_widget.dart';

void main() {
  Future<void> loadPage(WidgetTester tester,
      {required ExchangeEntity currentExchange}) async {
    var reviewPage = const TestAppWidget(
      child: ReviewPage(),
    );
    await tester.pumpWidget(reviewPage);
  }

  testWidgets(
      "WHEN review page is load THEN display page body with exchange infos",
      (WidgetTester tester) async {
    mockNetworkImagesFor(
      () async {
        FakeRepo repo = FakeRepo();
        ExchangeEntity exchange = repo.getExchange();
        await loadPage(tester, currentExchange: exchange);
        await tester.pumpAndSettle();

        expect(find.byType(ReviewPageBody), findsOneWidget);
      },
    );
  });
}
