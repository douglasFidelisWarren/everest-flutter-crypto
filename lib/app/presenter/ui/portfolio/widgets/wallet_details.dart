import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../data/datasources/wallet_datasource.dart';
import '../../shared/formater.dart';
import '../../shared/styles.dart';
import 'visibility_button.dart';

class WalletDetails extends ConsumerWidget {
  const WalletDetails({
    Key? key,
    required this.visible,
    required this.changeVisibility,
  }) : super(key: key);

  final bool visible;
  final Function changeVisibility;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WalletDatasource walletDataSource = WalletDatasource();
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Cripto", style: titleStyle),
              VisibilityButton(changeVisibility, visible),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              decoration: visibleDecoration(visible),
              child: Text(
                number.format(walletDataSource.getWallet()),
                style: visible ? totalStyle : totalStyleHide,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const Text(
            "Valor total de moedas",
            style: subTitleStyleTotal,
          ),
        ],
      ),
    );
  }
}
