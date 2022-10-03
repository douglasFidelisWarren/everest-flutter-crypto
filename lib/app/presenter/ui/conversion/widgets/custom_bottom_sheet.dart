import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/entities/coins_view_data.dart';
import '../../../controllers/providers/conversion_provider.dart';
import '../../shared/styles.dart';
import '../review_page.dart';

class CustomBottomSheet extends ConsumerWidget {
  const CustomBottomSheet({
    Key? key,
    required this.text,
    required this.coinSyn,
    required this.fromCoin,
  }) : super(key: key);

  final double text;
  final String coinSyn;
  final CoinViewData fromCoin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool valid = ref.watch(isValidProvider);
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
                  const Text(
                    'Total estimado',
                    style: smallGraySubTitle,
                  ),
                  Text(
                    "${text.toStringAsFixed(6)} $coinSyn",
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
                        Navigator.of(context).pushNamed(ReviewPage.route,
                            arguments: [fromCoin, coinSyn, text]);
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
