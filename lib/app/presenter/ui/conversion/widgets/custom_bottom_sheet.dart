import 'package:flutter/material.dart';

import '../../shared/styles.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    Key? key,
    required this.texto,
    required this.coinSyn,
    required this.valid,
  }) : super(key: key);

  final double texto;
  final String coinSyn;
  final bool valid;

  @override
  Widget build(BuildContext context) {
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
                    "${texto.toStringAsFixed(6)} $coinSyn",
                    style: appBarTextStyle,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: MaterialButton(
                onPressed: valid ? null : () {},
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
