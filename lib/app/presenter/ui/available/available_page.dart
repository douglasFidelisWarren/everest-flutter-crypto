import 'package:everest_crypto/app/presenter/ui/shared/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../shared/formater.dart';
import '../shared/styles.dart';
import '../../../data/datasources/wallet_datasource.dart';
import '../../../domain/entities/coin_entity.dart';
import '../../controllers/providers/get_all_coins_provider.dart';
import '../../controllers/providers/visible_provider.dart';
import '../details/details_page.dart';

class AvailablePage extends StatefulHookConsumerWidget {
  const AvailablePage({Key? key}) : super(key: key);

  static const route = '/available';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AvailablePageState();
}

class _AvailablePageState extends ConsumerState<AvailablePage> {
  late List<CoinEntity> coins;

  @override
  void initState() {
    super.initState();
    coins = ref.read(coinsNotifierProvider);
  }

  @override
  Widget build(BuildContext context) {
    //ref.read(coinsNotifierProvider.notifier).getAllCoins();
    final visible = ref.watch(visibleProvider);

    return Scaffold(
      appBar: const CustomAppBar('Criptos Disponíveis'),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Visibility(
                visible: coins.isNotEmpty,
                replacement: const Center(child: CircularProgressIndicator()),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: coins.length,
                  itemBuilder: (context, index) {
                    CoinEntity coin = coins[index];
                    double percentChange =
                        double.parse((coin.percentChange).toStringAsFixed(4));

                    return MaterialButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(DetailsPage.route, arguments: coin);
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6),
                            child: Card(
                              elevation: 10,
                              child: Row(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12,
                                          right: 12,
                                          top: 22,
                                          bottom: 22),
                                      child: Image.network(
                                        coin.image,
                                        height: 50,
                                      )),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(coin.symbol, style: valueStyle),
                                      const SizedBox(height: 4),
                                      Text(coin.name, style: subTitleStyleCoin),
                                    ],
                                  ),
                                  const Expanded(child: SizedBox()),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          decoration:
                                              visibleDecoration(visible),
                                          child: Text(
                                            number.format(
                                                double.parse(coin.latest)),
                                            style: valueStyle,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Container(
                                          alignment: Alignment.center,
                                          width: 80,
                                          height: 20,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: percentChange < 0
                                                  ? Colors.red.shade200
                                                  : Colors.green.shade200),
                                          child: Text(
                                            "${double.parse((percentChange).toStringAsFixed(4))}%",
                                            style: const TextStyle(
                                              color: colorBlackText,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
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
