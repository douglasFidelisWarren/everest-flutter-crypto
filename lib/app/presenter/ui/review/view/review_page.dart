import 'package:everest_crypto/app/presenter/ui/conversion/widgets/exchange_botton_sheet.dart';
import 'package:everest_crypto/l10n/core_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    ExchangeEntity currentExchange = ref.watch(exchangeProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(CoreStrings.of(context)!.reviewTitle),
      body: ReviewPageBody(
        currentExchange: currentExchange,
      ),
    );
  }
}

class ReviewPageBody extends StatelessWidget {
  const ReviewPageBody({
    Key? key,
    required this.currentExchange,
  }) : super(key: key);

  final ExchangeEntity currentExchange;

  @override
  Widget build(BuildContext context) {
    double sizeH = MediaQuery.of(context).size.height;
    double sizeW = MediaQuery.of(context).size.width;
    String toCoinSymbol = currentExchange.toCoin.symbol.toUpperCase();
    String fromCoinSymbol = currentExchange.fromCoin.symbol.toUpperCase();
    double valueExchange = currentExchange.valueExchange.toDouble();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 12,
            top: 30,
          ),
          child: Text(
            CoreStrings.of(context)!.reviewAlert,
            style: mediumBlackTitle1,
          ),
        ),
        const Expanded(child: SizedBox()),
        ConvertRow(
          amountConvert: currentExchange.amtConvert,
          fromSymbol: currentExchange.fromCoin.symbol.toUpperCase(),
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
        Center(
          child: ConfirmationButton(
            currentExchange: currentExchange,
            sizeW: sizeW,
            sizeH: sizeH,
          ),
        ),
        const SizedBox(height: 30)
      ],
    );
  }
}
