import 'package:everest_crypto/l10n/core_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/entities/coins_view_data.dart';
import '../../../controllers/providers/conversion_provider.dart';
import '../../../controllers/providers/get_all_coins_provider.dart';
import '../../shared/custom_app_bar.dart';
import '../../shared/styles.dart';
import '../widgets/amount_form_field.dart';
import '../widgets/exchange_botton_sheet.dart';
import '../widgets/to_coin_drop_list.dart';

class ConversionPage extends ConsumerWidget {
  const ConversionPage({Key? key, required this.fromCoin}) : super(key: key);

  static const route = '/conversion';
  final CoinViewData fromCoin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final fromCoin = ModalRoute.of(context)!.settings.arguments as CoinViewData;
    CoinViewData toCoin = ref.watch(toCoinProvider);

    AsyncValue<List<CoinViewData>> coins =
        ref.read(getAllcoinsNotifierProvider);
    List<CoinViewData> dropList = [];
    coins.whenData(
      (value) {
        for (var coin in coins.value!) {
          if (coin.name != fromCoin.name) {
            dropList.add(coin);
          }
        }
        if (ref.watch(toCoinProvider).id == '') {
          toCoin = dropList[0];
        }
      },
    );

    return Scaffold(
      appBar: CustomAppBar(CoreStrings.of(context)!.convertTitle),
      body: Column(children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.max, children: [
              Container(
                color: colorGrayBackgrond,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(CoreStrings.of(context)!.balanceAvailable,
                          style: smallGraySubTitle),
                      Text(
                        "${fromCoin.amount.toString()} ${fromCoin.symbol.toUpperCase()}",
                        style: mediunConvertBlack,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(26),
                child: Column(children: [
                  Text(
                    CoreStrings.of(context)!.convertQuery,
                    style: mediumBlackTitle1,
                  ),
                  const SizedBox(height: 30),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              left: 5, right: 10, top: 5, bottom: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1.5,
                                color: colorGrayDivider,
                              )),
                          child: Row(children: [
                            Image.network(
                              fromCoin.image,
                              height: 25,
                            ),
                            Text(
                              ' ${fromCoin.symbol.toUpperCase()}',
                            ),
                          ]),
                        ),
                        const Image(
                          height: 25,
                          image: AssetImage(
                            "assets/images/transactions.png",
                          ),
                        ),
                        ToCoinDropList(dropList: dropList),
                      ]),
                  AmoutFormField(fromCoin: fromCoin)
                ]),
              )
            ]),
          ),
        ),
        ExchangeBottonSheet(
          //formValue: formValue,
          toCoin: toCoin,
          //valid: valid,
          fromCoin: fromCoin,
          //textFormValue: textFormValue,
        ),
      ]),
    );
  }
}
