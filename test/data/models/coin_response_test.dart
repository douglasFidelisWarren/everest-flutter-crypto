import 'package:decimal/decimal.dart';
import 'package:everest_crypto/app/data/models/coin_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    "description",
    () async {
      CoinResponse response = CoinResponse(
        "id",
        "name",
        "symbol",
        "image",
        Decimal.parse("0"),
        1,
      );
      expect(response.toJson(), {
        "id": "id",
        "name": "name",
        "symbol": "symbol",
        "image": "image",
        "current_price": Decimal.parse("0"),
        "price_change_percentage_24h": 1.0
      });
    },
  );
}
