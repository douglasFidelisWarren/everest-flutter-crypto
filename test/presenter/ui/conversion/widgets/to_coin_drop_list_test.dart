import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:everest_crypto/app/presenter/ui/conversion/widgets/to_coin_drop_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../../helpers/fake_repo.dart';
import '../../../../helpers/test_app_widget.dart';

void main() {
  testWidgets(
    "WHEN the success page loads, THEN find ToCoinDropList ",
    (WidgetTester tester) async {
      mockNetworkImagesFor(
        () async {
          FakeRepo repo = FakeRepo();
          List<CoinViewData> dropList = repo.getCoinList();
          await loadPage(
              tester,
              ToCoinDropList(
                dropList: dropList,
              ));
          expect(find.byKey(const Key("dropDownItem")), findsWidgets);
        },
      );
    },
  );
}
