import 'package:decimal/decimal.dart';
import 'package:everest_crypto/l10n/core_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/entities/coins_view_data.dart';
import '../../../../domain/entities/exchange_entity.dart';
import '../../../controllers/providers/conversion_provider.dart';
import '../../review/view/review_page.dart';
import '../../shared/styles.dart';

final exchangeProvider = StateProvider<ExchangeEntity>(
  (ref) => ExchangeEntity(
      fromCoin: CoinViewData(
          id: "id",
          name: "name",
          symbol: "symbol",
          image: "image",
          currentPrice: Decimal.parse("0"),
          percentage24h: 0),
      toCoin: CoinViewData(
          id: "id",
          name: "name",
          symbol: "symbol",
          image: "image",
          currentPrice: Decimal.parse("0"),
          percentage24h: 0),
      amtConvert: Decimal.parse("0"),
      amtReceive: Decimal.parse("0"),
      date: DateTime.now(),
      valueExchange: Decimal.parse("0")),
);

class ExchangeBottonSheet extends ConsumerWidget {
  const ExchangeBottonSheet({
    Key? key,
    required this.formValue,
    required this.toCoin,
    required this.valid,
    required this.fromCoin,
    required this.textFormValue,
  }) : super(key: key);

  final double formValue;
  final CoinViewData toCoin;
  final bool valid;
  final CoinViewData fromCoin;
  final Decimal textFormValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Divider(
          thickness: 2,
          color: colorGrayDivider,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    CoreStrings.of(context)!.estimatedTotal,
                    style: smallGraySubTitle,
                  ),
                  Text(
                    "${formValue.toStringAsFixed(6)} ${toCoin.symbol.toUpperCase()}",
                    style: appBarTextStyle,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: MaterialButton(
                onPressed: valid
                    ? () {
                        ref.read(animateProvider.state).state = true;
                        ref.read(exchangeProvider.state).state = ref
                            .watch(convertCoinProvider)
                            .convertCoin(
                                fromCoin: fromCoin,
                                toCoin: toCoin,
                                amtConvert: textFormValue);
                        Navigator.of(context).pushNamed(
                          ReviewPage.route,
                        );
                      }
                    : null,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: valid ? colorBrandWarren : colorGraySubtitle,
                  child: const Icon(
                    Icons.arrow_forward_sharp,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
