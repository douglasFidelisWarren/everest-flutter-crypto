import 'package:everest_crypto/app/presenter/controllers/providers/get_coin_prices_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../data/datasources/wallet_datasource.dart';
import '../../../../domain/entities/coin_entity.dart';
import '../../../controllers/providers/get_chart_config_provider.dart';
import '../../../controllers/providers/visible_provider.dart';
import '../widgets/coin_list.dart';
import '../widgets/wallet_details.dart';

class PortfolioPage extends HookConsumerWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  static const route = '/portfolio';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visible = ref.watch(visibleProvider);
    WalletDatasource teste = WalletDatasource();
    List<CoinEntity> coinList = teste.getCoinsWallet();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8),
            WalletDetails(
                visible: visible,
                changeVisibility: () {
                  ref.watch(visibleProvider.state).state = !visible;
                }),
            CoinList(coinList: coinList, visible: visible),
          ],
        ),
      ),
    );
  }
}
