import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
import 'package:flutter/material.dart';

import '../../shared/formater.dart';
import '../../shared/styles.dart';
import 'value_chart_row.dart';

class BottonChartDetails extends StatelessWidget {
  const BottonChartDetails({
    Key? key,
    required this.coin,
  }) : super(key: key);

  final CoinViewData coin;

  @override
  Widget build(BuildContext context) {
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
              const Text(
                "Variação 24H",
                style: subTitleStyleTotal,
              ),
              Text(
                  coin.percentage24h > 0
                      ? "+${coin.percentage24h.toStringAsFixed(2)}"
                      : coin.percentage24h.toStringAsFixed(2),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      color: colorBrandWarren))
            ],
          ),
          const Divider(
            color: colorGrayDivider,
            height: 22,
            thickness: 1.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Quantidade",
                style: subTitleStyleTotal,
              ),
              Text("0,6555314 BTC", style: valueStyle)
            ],
          ),
          const Divider(
            color: colorGrayDivider,
            height: 22,
            thickness: 1.5,
          ),
          const ValueRowChart(text: "Valor", value: "R\$ 6.557,00"),
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
            onPressed: () {},
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
