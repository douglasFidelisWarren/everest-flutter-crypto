import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
                  dropList[0].image,
                  height: 25,
                ),
                Text(' ${dropList[0].symbol.toUpperCase()}'),
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