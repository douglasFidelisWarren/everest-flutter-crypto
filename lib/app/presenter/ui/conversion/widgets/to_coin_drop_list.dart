import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/entities/coins_view_data.dart';
import '../../../controllers/providers/conversion_provider.dart';
import '../../shared/styles.dart';

class ToCoinDropList extends ConsumerWidget {
  const ToCoinDropList({
    Key? key,
    required this.dropList,
  }) : super(key: key);

  final List<CoinViewData> dropList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CoinViewData currentCoin = dropList.isEmpty
        ? CoinViewData(
            currentPrice: Decimal.parse("0"),
            id: "",
            image: "",
            name: "",
            percentage24h: 0,
            symbol: "",
            amount: Decimal.parse("0"),
            amountVsCurrency: Decimal.parse("0"))
        : dropList.first;
    String? coinName;
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(
        left: 5,
        right: 10,
        top: 5,
        bottom: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 1.5,
          color: colorGrayDivider,
        ),
      ),
      width: 100,
      child: ButtonTheme(
        alignedDropdown: false,
        minWidth: 20,
        child: DropdownButtonFormField(
          key: const Key("dropDownButton"),
          decoration: InputDecoration.collapsed(
            hintText: coinName,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          isExpanded: true,
          items: dropList
              .map(
                (coin) => DropdownMenuItem<String>(
                  alignment: AlignmentDirectional.centerStart,
                  value: coin.name,
                  child: SizedBox(
                    width: 80,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        key: const Key("dropDownItem"),
                        children: [
                          Image(image: NetworkImage(coin.image, scale: 10)),
                          Text(
                            key: Key(coin.id),
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
                  currentCoin.image,
                  height: 25,
                ),
                Text(' ${currentCoin.symbol.toUpperCase()}'),
              ],
            ),
          ),
          onChanged: (value) {
            coinName = value.toString();
            for (var coin in dropList) {
              if (coin.name == value) {
                ref.read(toCoinProvider.state).state = coin;
              }
            }
          },
        ),
      ),
    );
  }
}
