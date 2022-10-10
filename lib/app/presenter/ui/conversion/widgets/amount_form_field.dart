import 'package:decimal/decimal.dart';
import 'package:everest_crypto/l10n/core_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/entities/coins_view_data.dart';
import '../../../controllers/providers/conversion_provider.dart';
import '../../shared/formater.dart';
import '../../shared/styles.dart';

class AmoutFormField extends ConsumerWidget {
  const AmoutFormField({
    Key? key,
    required this.fromCoin,
  }) : super(key: key);

  final CoinViewData fromCoin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String initialValue = '';
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
          initialValue: initialValue,
          decoration: InputDecoration(
            alignLabelWithHint: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            prefix: Text(
              "${fromCoin.symbol.toUpperCase()} ",
              style: const TextStyle(color: colorBlackText),
            ),
            label: Text(
              "${fromCoin.symbol.toUpperCase()} 0,00",
              style: const TextStyle(color: colorGraySubtitle),
            ),
          ),
          onChanged: (value) {
            ref.read(textFormValueProvider.state).state =
                value.isEmpty || value == '.' ? 0 : double.parse(value);
            if (value.isEmpty) {
              ref.read(isValidProvider.state).state = false;
            } else {
              if (double.parse(value) > fromCoin.amount!) {
                ref.read(isValidProvider.state).state = false;
              } else {
                ref.read(isValidProvider.state).state = true;
              }
              if (double.parse(value.toString()) == 0) {
                ref.read(isValidProvider.state).state = false;
              }
            }
          },
          autovalidateMode: AutovalidateMode.always,
          validator: (value) {
            if (value != '.') {
              if (value!.isNotEmpty && double.parse(value) > fromCoin.amount!) {
                return "${CoreStrings.of(context)!.balanceAvailable} ${fromCoin.symbol.toUpperCase()} ${CoreStrings.of(context)!.insufficient}";
              }
            }
            return null;
          },
        ),
        Text(
          number.format(ref.watch(textFormValueProvider) *
              Decimal.parse(fromCoin.currentPrice.toString()).toDouble()),
          style: smallGraySubTitle,
        ),
      ],
    );
  }
}
