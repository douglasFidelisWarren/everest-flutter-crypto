import 'package:flutter/material.dart';

import '../../../../../core/shared/formater.dart';
import '../../../../../core/shared/styles.dart';
import '../../../../data/datasources/wallet_datasource.dart';

class WalletDetails extends StatelessWidget {
  const WalletDetails({
    Key? key,
    required this.visible,
    required this.changeVisibility,
  }) : super(key: key);

  final bool visible;
  final Function changeVisibility;

  @override
  Widget build(BuildContext context) {
    WalletDatasource teste = WalletDatasource();
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            decoration: hideText,
            child: Text(
              "R\$ ${number.format(teste.getWallet())}",
              style: visible ? totalStyle : totalStyleHide,
              overflow: TextOverflow.ellipsis,
            ),
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
