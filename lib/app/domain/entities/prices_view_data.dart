import 'package:decimal/decimal.dart';

class PricesViewData {
  final Decimal prices;
  final Decimal marketcaps;
  final Decimal totalvolumes;
  PricesViewData({
    required this.prices,
    required this.marketcaps,
    required this.totalvolumes,
  });
}
