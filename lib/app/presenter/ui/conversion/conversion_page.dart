import 'package:everest_crypto/app/presenter/ui/shared/custom_app_bar.dart';
import 'package:everest_crypto/app/presenter/ui/shared/styles.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/coins_view_data.dart';

class ConversionPage extends StatelessWidget {
  const ConversionPage({Key? key}) : super(key: key);

  static const route = '/conversion';
  @override
  Widget build(BuildContext context) {
    final coin = ModalRoute.of(context)!.settings.arguments as CoinViewData;
    return Scaffold(
      appBar: CustomAppBar('Converter'),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            color: colorGrayBackgrond,
            child: Row(
              children: [
                Text(
                  'Saldo disponível',
                  style: mediumBlackTitle,
                ),
                Text(coin.amount.toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
