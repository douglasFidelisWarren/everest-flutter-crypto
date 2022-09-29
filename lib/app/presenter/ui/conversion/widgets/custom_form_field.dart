import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/entities/coins_view_data.dart';
import '../../../controllers/providers/conversion_provider.dart';
import '../../shared/formater.dart';
import '../../shared/styles.dart';

class CustomFormField extends HookConsumerWidget {
  const CustomFormField({
    Key? key,
    required this.coinANT,
    required this.valid,
  }) : super(key: key);

  final CoinViewData coinANT;
  final bool valid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          inputFormatters: [
            FilteringTextInputFormatter.allow(
              RegExp(r'^(\d+)?\.?\d{0,6}'),
            )
          ],
          style: const TextStyle(fontSize: 28),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            alignLabelWithHint: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            prefix: Text(
              "${coinANT.symbol.toUpperCase()} ",
              style: const TextStyle(color: colorBlackText),
            ),
            helperStyle: const TextStyle(color: colorBrandWarren),
            helperText: valid ? null : ref.watch(helpTextProvider),
            label: Text(
              "${coinANT.symbol.toUpperCase()} 0,00",
              style: const TextStyle(color: colorGraySubtitle),
            ),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'vazio';
            }
            return null;
          },
          onChanged: (text) {
            String value =
                text == '' ? '0' : text.replaceAll(RegExp(r'[^0-9]'), '');
            ref.read(textFormValueProvider.state).state = Decimal.parse(value);
            if (coinANT.amount! < Decimal.parse(value)) {
              ref.read(isValidProvider.state).state = false;
              ref.read(helpTextProvider.state).state =
                  'Saldo em ${coinANT.symbol.toUpperCase()} insuficiente para a conversão';
            } else {
              ref.read(helpTextProvider.state).state = '';
              ref.read(isValidProvider.state).state = true;
            }
          },
        ),
        Text(
          number.format(
              ref.watch(textFormValueProvider.state).state.toDouble() *
                  Decimal.parse(coinANT.currentPrice.toString()).toDouble()),
          style: smallGraySubTitle,
        ),
      ],
    );
  }
}
