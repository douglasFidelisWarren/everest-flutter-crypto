import 'package:everest_crypto/app/presenter/ui/review/view/review_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../../helpers/test_app_widget.dart';

void main() {
  testWidgets(
      "WHEN review page is load THEN display page body with exchange infos",
      (WidgetTester tester) async {
    mockNetworkImagesFor(
      () async {
        await loadPage(tester, const ReviewPage());
        await tester.pumpAndSettle();

        expect(find.byType(ReviewPageBody), findsOneWidget);
      },
    );
  });
}
