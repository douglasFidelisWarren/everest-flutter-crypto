import 'package:flutter/material.dart';

import '../../../../core/shared/formater.dart';
import '../../../../core/shared/styles.dart';
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
      appBar: AppBar(
        iconTheme: const IconThemeData(color: colorBlackText),
        elevation: .7,
        backgroundColor: Colors.white,
        title: const Text(
          'Detalhes',
          style: appBarTextStyle,
        ),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: ListTile(
            title: Text(
              coin.name,
              style: totalStyle,
            ),
            subtitle: Text(
              coin.symbol,
              style: subTitleStyleTotal,
            ),
            trailing: Image.asset(coin.image),
            isThreeLine: true,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.centerLeft,
          child: Text(
            "${number.format(latest)}",
            style: totalStyle,
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        LineChartCoin(),
      ]),
    );
  }
}
