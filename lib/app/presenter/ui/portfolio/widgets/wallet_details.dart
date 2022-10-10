import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../l10n/core_strings.dart';
import '../../../../domain/entities/coins_view_data.dart';
import '../../../controllers/providers/visible_provider.dart';
import '../../shared/formater.dart';
import '../../shared/styles.dart';

class WalletDetails extends ConsumerWidget {
  const WalletDetails({
    Key? key,
    required this.coins,
  }) : super(key: key);

  final List<CoinViewData> coins;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool visible = ref.watch(visibleProvider);
    Decimal totalValue = Decimal.parse('0');

    for (var coin in coins) {
      totalValue += Decimal.parse(coin.amountVsCurrency!.toString());
    }

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(CoreStrings.of(context)!.crypto, style: titleStyle),
              IconButton(
                onPressed: () {
                  ref.read(visibleProvider.state).state = !visible;
                },
                icon: Icon(
                  visible ? Icons.visibility : Icons.visibility_off,
                  color: colorBlackText,
                  size: 28,
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              key: const Key("hideValueContainer"),
              decoration: visibleDecoration(visible),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: visible ? 1 : 0,
                child: Text(
                  key: const Key("totalValue"),
                  number.format(totalValue.toDouble()),
                  style: totalStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          Text(
            CoreStrings.of(context)!.walletTotalAmount,
            style: subTitleStyleMediun,
          ),
        ],
      ),
    );
  }
}
