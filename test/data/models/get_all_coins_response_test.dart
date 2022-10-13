import 'package:decimal/decimal.dart';
import 'package:everest_crypto/app/data/models/coin_response.dart';
import 'package:everest_crypto/app/data/models/get_all_coins_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    "WHEN CoinResponse is generated THEN all attributes are required",
    () {
      CoinResponse coinResponse = CoinResponse(
        "id",
        "name",
        "symbol",
        "image",
        Decimal.parse("0"),
        1,
      );
      GetAllCoinsResponse response;
      response = GetAllCoinsResponse([coinResponse]);
      final result = response.toJson();

      expect(result.isNotEmpty, true);
    },
  );
}
