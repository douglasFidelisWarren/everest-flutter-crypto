import 'package:flutter/material.dart';

import '../../portfolio/model/coin.dart';
import '../../shared/formater.dart';
import '../../shared/styles.dart';
import '../widgets/line_chart_coin.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  static const route = '/details';

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    String filter = "5d";
    final coin = ModalRoute.of(context)!.settings.arguments as Coin;
    double latest = double.parse(coin.latest);
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
            "R\$ ${number.format(latest)}",
            style: totalStyle,
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 28,
            right: 28,
          ),
          child: LineChartCoin(),
        ),
      ]),
    );
  }
}
