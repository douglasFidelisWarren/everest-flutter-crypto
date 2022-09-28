import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/entities/coins_view_data.dart';
import '../../../controllers/providers/chart_config_provider.dart';
import '../../shared/custom_app_bar.dart';
import '../../shared/formater.dart';
import '../../shared/styles.dart';
import '../widgets/botton_chart_details.dart';
import '../widgets/line_chart_coin.dart';

class DetailsPage extends HookConsumerWidget {
  const DetailsPage({Key? key}) : super(key: key);

  static const route = '/details';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: invalid_use_of_protected_member
    final config = ref.watch(chartConfigProvider.notifier).state;
    double percent = config.percent;

    final coin = ModalRoute.of(context)!.settings.arguments as CoinViewData;
    double latest = double.parse(coin.currentPrice.toString());
    return Scaffold(
      appBar: const CustomAppBar("Detalhes"),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: ListTile(
                title: Text(coin.name, style: totalStyle),
                subtitle:
                    Text(coin.symbol.toUpperCase(), style: subTitleStyleTotal),
                trailing: Image.network(
                  coin.image,
                  height: 50,
                ),
                isThreeLine: true),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.centerLeft,
            child: Text(number.format(latest), style: totalStyle),
          ),
          const SizedBox(height: 35),
          LineChartCoin(coin, config),
          BottonChartDetails(coin, percent),
        ]),
      ),
    );
  }
}
