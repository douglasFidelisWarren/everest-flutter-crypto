import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/entities/exchange_entity.dart';
import '../../shared/custom_app_bar.dart';
import '../../shared/styles.dart';
import '../widgets/confirmation_button.dart';
import '../widgets/convert_row.dart';
import '../widgets/exchange_row.dart';
import '../widgets/receive_row.dart';

class ReviewPage extends ConsumerWidget {
  const ReviewPage({Key? key}) : super(key: key);

  static const route = '/review';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentExchange =
        ModalRoute.of(context)!.settings.arguments as ExchangeEntity;

    double sizeH = MediaQuery.of(context).size.height;
    double sizeW = MediaQuery.of(context).size.width;
    String toCoinSymbol = currentExchange.toCoinSymbol;
    String fromCoinSymbol = currentExchange.fromCoinSymbol;
    double valueExchange = currentExchange.valueExchange.toDouble();

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
            amountConvert: currentExchange.amtConvert,
            fromSymbol: currentExchange.fromCoinSymbol,
          ),
          ReceiveRow(
            currentExchange: currentExchange,
          ),
          ExchangeRow(
            toCoinSymbol: toCoinSymbol,
            valueExchange: valueExchange,
            fromCoinSymbol: fromCoinSymbol,
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
