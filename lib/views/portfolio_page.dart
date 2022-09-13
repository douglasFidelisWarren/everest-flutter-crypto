import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/coin.dart';
import '../repositories/coin_repository.dart';
import '../shared/styles.dart';

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
    List<Coin> coinList = repository.getCoins();
    Decoration hideText = BoxDecoration(
      color: visible ? colorHideOff : colorHideOn,
      borderRadius: BorderRadius.circular(5),
    );
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Cripto",
                        style: titleStyle,
                      ),
                      IconButton(
                        onPressed: () => setState(() {
                          visible = !visible;
                        }),
                        icon: Icon(
                          visible ? Icons.visibility : Icons.visibility_off,
                          color: colorBlackText,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: hideText,
                    child: Text(
                      "R\$ 14.798,00",
                      style: visible ? totalStyle : totalStyleHide,
                    ),
                  ),
                  const Text(
                    "Valor total de moedas",
                    style: subTitleStyleTotal,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: coinList.length,
                itemBuilder: (context, index) {
                  Coin coin = coinList[index];
                  var amount = Decimal.parse(coin.amount);
                  var latest = Decimal.parse(coin.latest);
                  double value = (amount * latest).toDouble();
                  return Column(
                    children: [
                      const Divider(
                        color: colorGrayDivider,
                        thickness: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 18,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image(
                                height: 50,
                                image: AssetImage(
                                  coin.image,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  coin.symbol,
                                  style: valueStyle,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  coin.name,
                                  style: subTitleStyleCoin,
                                ),
                              ],
                            ),
                            const Expanded(
                              child: SizedBox(),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: hideText,
                                  child: Text(
                                    "R\$ ${number.format(value)}",
                                    style:
                                        visible ? valueStyle : valueStyleHide,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: hideText,
                                      child: Text(
                                        coin.amount,
                                        style: visible
                                            ? subTitleStyleCoin
                                            : subTitleStyleCoinHide,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      coin.symbol,
                                      style: subTitleStyleCoin,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                bottom: 30.0,
                                left: 10,
                              ),
                              child: Icon(
                                Icons.arrow_forward_ios_sharp,
                                size: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
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
