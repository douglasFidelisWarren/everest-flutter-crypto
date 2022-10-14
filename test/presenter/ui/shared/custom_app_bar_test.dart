import 'package:everest_crypto/app/presenter/ui/shared/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/test_app_widget.dart';

void main() {
  testWidgets(
    "WHEN CustomAppBar is called THEN app bar title equals page title",
    (WidgetTester tester) async {
      String pageTitle = "Title";
      await loadPage(tester, CustomAppBar(pageTitle));

      final title = tester.widget<Text>(find.byKey(const Key("pageTitle")));
      expect(title.data, pageTitle);
    },
  );
}