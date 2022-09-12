import 'package:flutter/material.dart';

import '../models/coin.dart';
import '../repositories/coin_repository.dart';
import '../shared/styles.dart';
import 'widgets/coin_list.dart';
import 'widgets/walletDetails.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  CoinRepository repository = CoinRepository();
  bool visible = true;

  void changeVisibility() {
    setState(() {
      visible = !visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Coin> coinList = repository.getAllCoins();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(
                18.0,
              ),
              child: WalletDetails(
                changeVisibility: changeVisibility,
                visible: visible,
                repository: repository,
              ),
            ),
            CoinList(
              coinList: coinList,
              repository: repository,
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
