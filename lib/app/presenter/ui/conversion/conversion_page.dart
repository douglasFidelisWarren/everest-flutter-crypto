import 'package:decimal/decimal.dart';
import 'package:everest_crypto/app/presenter/ui/shared/custom_app_bar.dart';
import 'package:everest_crypto/app/presenter/ui/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entities/coins_view_data.dart';
import '../../controllers/providers/get_all_coins_provider.dart';
import '../../controllers/providers/conversion_provider.dart';
import 'widgets/coins_comparection.dart';
import 'widgets/custom_bottom_sheet.dart';
import 'widgets/custom_form_field.dart';

class ConversionPage extends HookConsumerWidget {
  const ConversionPage({Key? key}) : super(key: key);

  static const route = '/conversion';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fromCoin = ModalRoute.of(context)!.settings.arguments as CoinViewData;
    // CoinViewData toCoin;
    Decimal textFormValue = ref.watch(textFormValueProvider.state).state;
    Decimal fromCoinPrice = Decimal.parse(fromCoin.currentPrice.toString());
    AsyncValue<List<CoinViewData>> coins =
        ref.read(getAllcoinsNotifierProvider);
    List<CoinViewData> dropList = [];
    coins.whenData(
      (value) {
        for (var coin in coins.value!) {
          if (coin.name != fromCoin.name) {
            dropList.add(coin);
          }
        }

        ref.watch(setedCoinPriceProvider.state).state =
            dropList[0].currentPrice;
        ref.watch(setedCoinSynbol.state).state =
            dropList[0].symbol.toUpperCase();
      },
    );
    Decimal setedCoinPrice =
        ref.read(setedCoinPriceProvider.state).state == Decimal.parse('0')
            ? dropList[0].currentPrice
            : ref.read(setedCoinPriceProvider.state).state;

    String coinSyn = ref.watch(setedCoinSynbol.state).state;
    //  == ''
    //     ? dropList[0].symbol.toUpperCase()
    //     : ref.watch(setedCoinSynbol.state).state;

    double formValue = (textFormValue * fromCoinPrice).toDouble();
    double formText = formValue / setedCoinPrice.toDouble();

    return Scaffold(
      appBar: const CustomAppBar('Converter'),
      body: Column(children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.max, children: [
              Container(
                color: colorGrayBackgrond,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Saldo disponível', style: smallGraySubTitle),
                      Text(
                        '${fromCoin.amount.toString().replaceAll('.', ',')} ${fromCoin.symbol.toUpperCase()}',
                        style: mediunConvertBlack,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(26),
                child: Column(children: [
                  const Text(
                    'Quanto você gostaria de converter?',
                    style: mediumBlackTitle1,
                  ),
                  const SizedBox(height: 30),
                  CoinsComparection(fromCoin: fromCoin, listaDrop: dropList),
                  CustomFormField(fromCoin: fromCoin)
                ]),
              )
            ]),
          ),
        ),
        CustomBottomSheet(text: formText, coinSyn: coinSyn, fromCoin: fromCoin),
      ]),
    );
  }
}
