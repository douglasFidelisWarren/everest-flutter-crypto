// import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
// import 'package:everest_crypto/app/presenter/ui/portfolio/widgets/body_data.dart';
// import 'package:everest_crypto/app/presenter/ui/portfolio/widgets/coin_details.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:network_image_mock/network_image_mock.dart';

// import '../../shared/fake_repo.dart';
// import '../../test_app_widget.dart';

// void main() {
//   Future<void> loadPage(WidgetTester tester,
//       {required CoinViewData coin}) async {
//     var dataBody = const TestAppWidget(
//       child: BodyData(),
//     );
//     await tester.pumpWidget(dataBody);
//   }

//   testWidgets("description", (WidgetTester tester) async {
//     mockNetworkImagesFor(
//       () async {
//         FakeRepo repo = FakeRepo();
//         CoinViewData coin = repo.getCoin();
//         await loadPage(tester, coin: coin);
//         await tester.pumpAndSettle();

//         expect(find.byType(CoinDetails), findsOneWidget);
//       },
//     );
//   });
// }
