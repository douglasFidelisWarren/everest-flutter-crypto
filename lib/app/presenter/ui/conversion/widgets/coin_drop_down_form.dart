import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/entities/coins_view_data.dart';
import '../../../controllers/providers/conversion_provider.dart';

final movement = StateProvider<Map>(
  (ref) => {},
);

class CoinDropDownForm extends HookConsumerWidget {
  const CoinDropDownForm({
    Key? key,
    required this.listaDrop,
  }) : super(key: key);

  final List<CoinViewData> listaDrop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? coinName;
    return ButtonTheme(
      alignedDropdown: false,
      minWidth: 20,
      child: DropdownButtonFormField(
        decoration: InputDecoration.collapsed(
          hintText: coinName,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        isExpanded: true,
        items: listaDrop
            .map(
              (coin) => DropdownMenuItem<String>(
                alignment: AlignmentDirectional.centerStart,
                value: coin.name,
                child: SizedBox(
                  width: 80,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Image.network(
                          coin.image,
                          height: 25,
                        ),
                        Text(
                          ' ${coin.symbol.toUpperCase()}',
                          overflow: TextOverflow.clip,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
            .toList(),
        value: coinName,
        hint: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Image.network(
                listaDrop[0].image,
                height: 25,
              ),
              Text(' ${listaDrop[0].symbol.toUpperCase()}'),
            ],
          ),
        ),
        onChanged: (value) {
          coinName = value.toString();
          for (var coin in listaDrop) {
            if (coin.name == value) {
              ref.watch(setedCoinPriceProvider.state).state = coin.currentPrice;
              ref.read(setedCoinSynbolPrice.state).state =
                  coin.symbol.toUpperCase();
            }
          }
        },
      ),
    );
  }
}
