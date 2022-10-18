import 'package:everest_crypto/app/presenter/ui/portfolio/view/portfolio_page.dart';
import 'package:everest_crypto/app/presenter/ui/shared/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../l10n/core_strings.dart';
import '../../../../domain/entities/coins_view_data.dart';
import '../../../controllers/providers/get_all_coins_provider.dart';
import '../../shared/custom_app_bar.dart';
import '../widgets/available_card_coin.dart';

class AvailablePage extends ConsumerWidget {
  const AvailablePage({Key? key, required this.coins}) : super(key: key);

  static const route = '/available';

  final List<CoinViewData> coins;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<CoinViewData>? coinsList =
        ref.watch(getAllcoinsNotifierProvider).value ?? coins;
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavBar(index: 1),
      appBar: CustomAppBar(CoreStrings.of(context)!.availableCoins),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: coinsList.length,
                itemBuilder: (context, index) {
                  CoinViewData coin = coinsList[index];
                  return AvailableCardCoin(coin: coin);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
