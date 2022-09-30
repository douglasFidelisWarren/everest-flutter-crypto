import 'package:decimal/decimal.dart';
import 'package:everest_crypto/app/presenter/ui/shared/custom_app_bar.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entities/coins_view_data.dart';
import '../../controllers/providers/conversion_provider.dart';
import '../shared/styles.dart';
import 'conversion_page.dart';

class ReviewPage extends ConsumerWidget {
  const ReviewPage({Key? key}) : super(key: key);

  static const route = '/review';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments as List;
    CoinViewData fromCoin = args[0];
    String toCoinSyn = args[1];
    Decimal amountConvert = ref.watch(textFormValueProvider);
    // amountReceive

    String fromSymbol = fromCoin.symbol.toUpperCase();
    String toSymbol = ref.watch(setedCoinSynbol.state).state;
    double exchange = fromCoin.currentPrice.toDouble() /
        ref.watch(teste.state).state.toDouble();

    return Scaffold(
      appBar: const CustomAppBar('Revisar'),
      body: Column(children: [
        const Padding(
          padding: EdgeInsets.only(
            left: 12,
            top: 30,
          ),
          child: Text(
            "Revise os dados da sua conversão",
            style: mediumBlackTitle1,
          ),
        ),
        const Expanded(child: SizedBox()),
        const Divider(thickness: 2, color: colorGrayDivider),
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text('Converter', style: subTitleStyleMediun),
            Text('${exchange}', style: mediumBlackTitle)
          ]),
        ),
        const Divider(thickness: 2, color: colorGrayDivider),
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Receber', style: subTitleStyleMediun),
                Text('value', style: mediumBlackTitle)
              ]),
        ),
        const Divider(thickness: 2, color: colorGrayDivider),
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text('Câmbio', style: subTitleStyleMediun),
            Text('1 $fromSymbol = ${exchange.toStringAsFixed(6)} $toSymbol',
                style: mediumBlackTitle)
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            height: 45,
            color: colorBrandWarren,
            minWidth: 600,
            onPressed: () {
              // ref.read(helpTextProvider.state).state = '';
              // ref.read(textFormValueProvider.state).state =
              //     Decimal.parse('0.0');
              // ref.read(setedCoinPriceProvider.state).state = Decimal.parse('0');
              // Navigator.of(context)
              //     .pushNamed(ConversionPage.route, arguments: coin);
            },
            child: const Text(
              "Converter moeda",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        )
      ]),
    );
  }
}
