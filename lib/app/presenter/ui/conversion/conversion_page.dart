import 'dart:ui';

import 'package:decimal/decimal.dart';
import 'package:everest_crypto/app/presenter/ui/shared/custom_app_bar.dart';
import 'package:everest_crypto/app/presenter/ui/shared/formater.dart';
import 'package:everest_crypto/app/presenter/ui/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entities/coins_view_data.dart';
import '../../controllers/providers/get_all_coins_provider.dart';

final quntidadeDigitadaProvider =
    StateProvider<Decimal>((ref) => Decimal.parse('0.0'));

final valorMoeda2Provider = StateProvider<Decimal>(
  (ref) => Decimal.parse('0.0'),
);

final sinb = StateProvider<String>(
  (ref) => '',
);

class ConversionPage extends StatefulHookConsumerWidget {
  const ConversionPage({Key? key}) : super(key: key);

  static const route = '/conversion';

  @override
  ConsumerState<ConversionPage> createState() => _ConversionPageState();
}

class _ConversionPageState extends ConsumerState<ConversionPage> {
  @override
  Widget build(BuildContext context) {
    final coinANT = ModalRoute.of(context)!.settings.arguments as CoinViewData;
    String? coinName;
    Decimal qtd = ref.watch(quntidadeDigitadaProvider.state).state;
    Decimal moeda1 = Decimal.parse(coinANT.currentPrice.toString());
    AsyncValue<List<CoinViewData>> coins =
        ref.read(getAllcoinsNotifierProvider);
    List<CoinViewData> listaDrop = [];
    coins.whenData(
      (value) {
        for (var coin in coins.value!) {
          if (coin.name != coinANT.name) {
            listaDrop.add(coin);
          }
        }
      },
    );
    // ref.watch(valorMoeda2Provider.state).state = listaDrop[0].currentPrice;

    Decimal valorMoeda2 =
        ref.read(valorMoeda2Provider.state).state == Decimal.parse('0')
            ? listaDrop[0].currentPrice
            : ref.read(valorMoeda2Provider.state).state;

    String coinSyn = ref.watch(sinb.state).state == ''
        ? listaDrop[0].symbol.toUpperCase()
        : ref.watch(sinb.state).state;

    double valor = (qtd * moeda1).toDouble();
    double texto = valor / valorMoeda2.toDouble();
    return Scaffold(
      appBar: const CustomAppBar('Converter'),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    color: colorGrayBackgrond,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Saldo disponível',
                            style: smallGraySubTitle,
                          ),
                          Text(
                            '${coinANT.amount.toString().replaceAll('.', ',')} ${coinANT.symbol.toUpperCase()}',
                            style: mediunConvertBlack,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(26),
                    child: Column(
                      children: [
                        const Text(
                          'Quanto você gostaria de converter?',
                          style: mediumBlackTitle1,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
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
                              child: Row(
                                children: [
                                  Image.network(
                                    coinANT.image,
                                    height: 25,
                                  ),
                                  Text(' ${coinANT.symbol.toUpperCase()}'),
                                ],
                              ),
                            ),
                            const Image(
                              height: 25,
                              image:
                                  AssetImage("assets/images/transactions.png"),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(
                                  left: 5, right: 10, top: 5, bottom: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    width: 1.5,
                                    color: colorGrayDivider,
                                  )),
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
                                  items: listaDrop
                                      .map(
                                        (coin) => DropdownMenuItem<String>(
                                          alignment:
                                              AlignmentDirectional.centerStart,
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
                                        Text(
                                            ' ${listaDrop[0].symbol.toUpperCase()}'),
                                      ],
                                    ),
                                  ),
                                  onChanged: (value) {
                                    coinName = value.toString();

                                    for (var coin in listaDrop) {
                                      if (coin.name == value) {
                                        ref
                                            .watch(valorMoeda2Provider.state)
                                            .state = coin.currentPrice;
                                        ref.read(sinb.state).state =
                                            coin.symbol.toUpperCase();
                                        print(coin.currentPrice);
                                        setState(() {
                                          coinSyn = coin.symbol.toUpperCase();
                                        });
                                      }
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              style: TextStyle(fontSize: 28),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                alignLabelWithHint: true,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                prefix: Text(
                                  "${coinANT.symbol.toUpperCase()} ",
                                  style: TextStyle(color: colorBlackText),
                                ),
                                //icon: Text('${coinANT.symbol.toUpperCase()}'),
                                // hintText: '${coinANT.symbol.toUpperCase()} $qtd',

                                //labelText: 'teste',
                                label: Text(
                                  "${coinANT.symbol.toUpperCase()} 0,00",
                                  style: TextStyle(color: colorGraySubtitle),
                                ),
                                // isDense: false,
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'vazio';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  ref
                                      .read(quntidadeDigitadaProvider.state)
                                      .state = Decimal.parse(value);
                                });
                              },
                            ),
                            Text(
                              number.format(ref
                                      .watch(quntidadeDigitadaProvider.state)
                                      .state
                                      .toDouble() *
                                  Decimal.parse(coinANT.currentPrice.toString())
                                      .toDouble()),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Total estimado'),
              Text("${texto.toStringAsFixed(6)} $coinSyn"),
            ],
          ),
        ],
      ),
    );
  }
}
