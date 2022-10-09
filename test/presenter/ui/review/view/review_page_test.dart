import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:everest_crypto/app/domain/entities/exchange_entity.dart';
import 'package:everest_crypto/app/presenter/ui/portfolio/view/portfolio_page.dart';
import 'package:everest_crypto/app/presenter/ui/portfolio/widgets/page_body.dart';
import 'package:everest_crypto/app/presenter/ui/review/view/review_page.dart';
import 'package:everest_crypto/app/presenter/ui/review/widgets/convert_row.dart';
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

  testWidgets("description", (WidgetTester tester) async {
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
