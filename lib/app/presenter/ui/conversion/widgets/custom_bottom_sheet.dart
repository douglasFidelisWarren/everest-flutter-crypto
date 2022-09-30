import 'package:decimal/decimal.dart';
import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../controllers/providers/conversion_provider.dart';
import '../../shared/styles.dart';
import '../review_page.dart';

class CustomBottomSheet extends ConsumerWidget {
  const CustomBottomSheet({
    Key? key,
    required this.text,
    required this.coinSyn,
    required this.fromCoin,
  }) : super(key: key);

  final double text;
  final String coinSyn;
  final CoinViewData fromCoin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool valid = ref.watch(isValidProvider);
    // final toCoinPrice =

    String? amountConvert;
    String? amountReceive;
    //String exchange;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Divider(
          thickness: 2,
          color: colorGrayDivider,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total estimado',
                    style: smallGraySubTitle,
                  ),
                  Text(
                    "${text.toStringAsFixed(6)} $coinSyn",
                    style: appBarTextStyle,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: MaterialButton(
                onPressed: valid
                    ? () {
                        print(
                            'converter ${ref.watch(textFormValueProvider)} ${fromCoin.symbol.toUpperCase()}');
                        print('receber ${text.toStringAsFixed(6)} $coinSyn');

                        // print(
                        //   'cembio 1 ${fromCoin.symbol.toUpperCase()} = ${d.toStringAsFixed(6)} $coinSyn');
                        // print('cembio $toCoinPrice');
                        // ref.read(movement.state).state = {
                        //   'converter': Decimal.parse("10"),
                        //   'receber': Decimal.parse("1"),
                        //   'cambio': Decimal.parse("1"),
// final textFormValueProvider =
//     StateProvider<Decimal>((ref) => Decimal.parse('0.0'));

// final setedCoinPriceProvider = StateProvider<Decimal>(
//   (ref) => Decimal.parse('0.0'),
// );

// final setedCoinSynbolPrice = StateProvider<String>(
//   (ref) => '',
// );
// final helpTextProvider = StateProvider<String>(
//   (ref) => '',
// );

// final isValidProvider = StateProvider<bool>(
//   (ref) => false,
// );

                        // };
                        Navigator.of(context).pushNamed(ReviewPage.route,
                            arguments: [fromCoin, coinSyn]);
                      }
                    : null,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: valid ? colorBrandWarren : colorGraySubtitle,
                  child: const Icon(
                    Icons.arrow_forward_sharp,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
