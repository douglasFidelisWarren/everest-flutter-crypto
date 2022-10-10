import 'package:everest_crypto/app/presenter/ui/conversion/view/success_page.dart';
import 'package:everest_crypto/app/presenter/ui/shared/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../../helpers/test_app_widget.dart';

void main() {
  Future<void> loadPage(WidgetTester tester) async {
    var successPage = const TestAppWidget(
      child: SuccessPage(),
    );
    await tester.pumpWidget(successPage);
  }

  testWidgets(
    "WHEN the success page loads, THEN display the success message",
    (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadPage(tester);
        await tester.pumpAndSettle();
        final subtitleSuccess =
            tester.widget<Text>(find.byKey(const Key("subtitleSuccess")));
        expect(subtitleSuccess.style, smallGraySubTitle);
      });
    },
  );
}
