import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../data/datasources/wallet_datasource.dart';
import '../../../../domain/entities/coin_entity.dart';
import '../../../controllers/visible_controller.dart';
import '../widgets/coin_list.dart';
import '../widgets/wallet_details.dart';

class PortfolioPage extends HookConsumerWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  static const route = '/portfolio';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visible = ref.watch(visibleNotifierProvider);
    WalletDatasource teste = WalletDatasource();
    List<CoinEntity> coinList = teste.getCoinsWallet();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(
                18.0,
              ),
              child: WalletDetails(
                  visible: visible,
                  changeVisibility: () {
                    ref.watch(visibleNotifierProvider.state).state = !visible;
                  }),
            ),
            CoinList(
              coinList: coinList,
              visible: visible,
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
