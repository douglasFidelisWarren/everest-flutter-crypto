import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entities/coins_view_data.dart';
import '../../controllers/providers/conversion_provider.dart';
import '../shared/custom_app_bar.dart';
import '../shared/styles.dart';
import 'widgets/confirmation_button.dart';
import 'widgets/convert_row.dart';
import 'widgets/exchange_row.dart';
import 'widgets/receive_row.dart';

class ReviewPage extends ConsumerWidget {
  const ReviewPage({Key? key}) : super(key: key);

  static const route = '/review';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments as List;
    CoinViewData fromCoin = args[0];
    Decimal amountConvert = ref.watch(textFormValueProvider);
    double amountReceive = args[2];

    String fromSymbol = fromCoin.symbol.toUpperCase();
    String toSymbol = ref.watch(setedCoinSynbol.state).state;
    double exchange = fromCoin.currentPrice.toDouble() /
        ref.watch(setedCoinPriceProvider).toDouble();

    double sizeH = MediaQuery.of(context).size.height;
    double sizeW = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar('Revisar'),
      body: Column(
        children: [
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
          ConvertRow(
            amountConvert: amountConvert,
            fromSymbol: fromSymbol,
          ),
          ReceiveRow(
            amountReceive: amountReceive,
            toSymbol: toSymbol,
          ),
          ExchangeRow(
            fromSymbol: fromSymbol,
            exchange: exchange,
            toSymbol: toSymbol,
          ),
          const SizedBox(
            height: 20,
          ),
          ConfirmationButton(
            sizeW: sizeW,
            sizeH: sizeH,
          ),
          const SizedBox(height: 30)
        ],
      ),
    );
  }
}
