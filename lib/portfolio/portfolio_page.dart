import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/coin.dart';
import '../repositories/coin_repository.dart';
import 'widgets/coin_list.dart';
import 'widgets/wallet_details.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  bool visible = true;
  NumberFormat number = NumberFormat("#,###.00", "pt_BR");

  @override
  Widget build(BuildContext context) {
    CoinRepository repository = CoinRepository();
    List<Coin> coinList = repository.getAllCoins();

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
                  repository: repository,
                  changeVisibility: () {
                    setState(() {
                      visible = !visible;
                    });
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
