import 'package:everest_crypto/app/domain/entities/chart_config_entity.dart';
import 'package:everest_crypto/app/presenter/ui/portfolio/widgets/coin_details.dart';
import 'package:everest_crypto/app/presenter/ui/portfolio/widgets/page_body.dart';
import 'package:everest_crypto/l10n/core_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/entities/coins_view_data.dart';
import '../../../controllers/providers/chart_config_provider.dart';
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
    // ignore: invalid_use_of_protected_member

    CoinViewData coin = ref.watch(detailCoinProvider);
    double percent = config.percent;

    //final coin = ModalRoute.of(context)!.settings.arguments as CoinViewData;
    double latest = double.parse(coin.currentPrice.toString());
    return Scaffold(
      appBar: CustomAppBar(CoreStrings.of(context)!.details),
      body: SingleChildScrollView(
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
