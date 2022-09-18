import 'package:flutter/material.dart';

import '../shared/custom_app_bar.dart';
import '../shared/formater.dart';
import '../shared/styles.dart';
import '../../../domain/entities/coin_entity.dart';
import 'widgets/line_chart_coin.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  static const route = '/details';

  @override
  Widget build(BuildContext context) {
    //String filter = "5d";
    final coin = ModalRoute.of(context)!.settings.arguments as CoinEntity;
    double latest = double.parse((coin.latest));
    return Scaffold(
      appBar: const CustomAppBar("Detalhes"),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: ListTile(
              title: Text(coin.name, style: totalStyle),
              subtitle: Text(coin.symbol, style: subTitleStyleTotal),
              trailing: Image.asset(coin.image),
              isThreeLine: true),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.centerLeft,
          child: Text(number.format(latest), style: totalStyle),
        ),
        const SizedBox(height: 35),
        const LineChartCoin(),
      ]),
    );
  }
}
