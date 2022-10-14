import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../l10n/core_strings.dart';
import '../../../../domain/entities/chart_config_entity.dart';
import '../../../../domain/entities/coins_view_data.dart';
import '../../../controllers/providers/providers.dart';
import '../../shared/custom_app_bar.dart';
import '../../shared/formater.dart';
import '../../shared/styles.dart';
import '../widgets/botton_chart_details.dart';
import '../widgets/line_chart_coin.dart';

class DetailsPage extends ConsumerWidget {
  const DetailsPage({Key? key, required this.coin, required this.config})
      : super(key: key);

  static const route = '/details';
  final CoinViewData coin;
  final ChartConfigViewData config;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CoinViewData coin = ref.watch(detailCoinProvider);
    double percent = config.percent;

    double latest = double.parse(coin.currentPrice.toString());
    return Scaffold(
      appBar: CustomAppBar(CoreStrings.of(context)!.details),
      body: SingleChildScrollView(
        key: const Key("bodyScroll"),
        scrollDirection: Axis.vertical,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: ListTile(
                title: Text(coin.name, style: totalStyle),
                subtitle:
                    Text(coin.symbol.toUpperCase(), style: subTitleStyleMediun),
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
          LineChartCoin(
            coin,
          ),
          BottonChartDetails(coin, percent),
        ]),
      ),
    );
  }
}
