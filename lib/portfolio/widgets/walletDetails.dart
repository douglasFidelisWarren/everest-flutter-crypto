import 'package:flutter/material.dart';

import '../../repositories/coin_repository.dart';
import '../../shared/formater.dart';
import '../../shared/styles.dart';

class WalletDetails extends StatelessWidget {
  const WalletDetails({
    Key? key,
    required this.visible,
    required this.repository,
    required this.changeVisibility,
  }) : super(key: key);

  final bool visible;
  final CoinRepository repository;
  final Function changeVisibility;

  @override
  Widget build(BuildContext context) {
    Decoration hideText = BoxDecoration(
      color: visible ? colorHideOff : colorHideOn,
      borderRadius: BorderRadius.circular(5),
    );
    return Column(
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
              onPressed: () => changeVisibility(),
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
            "R\$ ${number.format(repository.getWallet())}",
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
    );
  }
}
