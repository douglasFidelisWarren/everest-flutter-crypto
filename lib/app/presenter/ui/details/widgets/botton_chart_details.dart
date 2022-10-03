import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/entities/coins_view_data.dart';
import '../../../controllers/providers/conversion_provider.dart';
import '../../conversion/conversion_page.dart';
import '../../shared/formater.dart';
import '../../shared/styles.dart';
import 'line_chart_coin.dart';
import 'value_chart_row.dart';

class BottonChartDetails extends HookConsumerWidget {
  const BottonChartDetails(
    this.coin,
    this.percent, {
    Key? key,
  }) : super(key: key);

  final CoinViewData coin;
  final double percent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18),
      child: Column(
        children: [
          const Divider(
            color: colorGrayDivider,
            height: 22,
            thickness: 1.5,
          ),
          ValueRowChart(
              text: "Preço atual",
              value: number.format(coin.currentPrice.toDouble())),
          const Divider(
            color: colorGrayDivider,
            height: 22,
            thickness: 1.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Variação em ${ref.watch(selectedProvider)} dias",
                style: subTitleStyleMediun,
              ),
              Text(
                  percent > 0
                      ? "+${percent.toStringAsFixed(2)}%"
                      : "${percent.toStringAsFixed(2)}%",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      color: percent > 0
                          ? const Color.fromARGB(255, 61, 161, 65)
                          : colorBrandWarren))
            ],
          ),
          const Divider(
            color: colorGrayDivider,
            height: 22,
            thickness: 1.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Quantidade",
                style: subTitleStyleMediun,
              ),
              Text(
                  "${coin.amount!.toStringAsFixed(8).replaceAll(".", ",")} ${coin.symbol.toUpperCase()}",
                  style: mediumBlackTitle)
            ],
          ),
          const Divider(
            color: colorGrayDivider,
            height: 22,
            thickness: 1.5,
          ),
          ValueRowChart(
              text: "Valor",
              value: number.format(coin.amountVsCurrency!.toDouble())),
          const Divider(
            color: colorGrayDivider,
            height: 30,
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            height: 45,
            color: colorBrandWarren,
            minWidth: 600,
            onPressed: () {
              ref.read(toCoinProvider.state).state = CoinViewData(
                id: '',
                name: '',
                symbol: '',
                image: '',
                currentPrice: Decimal.parse('0'),
                percentage24h: 0,
              );
              ref.read(textFormValueProvider.state).state = 0;
              ref.read(helpTextProvider.state).state = '';
              Navigator.of(context)
                  .pushNamed(ConversionPage.route, arguments: coin);
            },
            child: const Text(
              "Converter moeda",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
