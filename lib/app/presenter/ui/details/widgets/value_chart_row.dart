import 'package:flutter/material.dart';

import '../../shared/styles.dart';

class ValueRowChart extends StatelessWidget {
  const ValueRowChart({
    Key? key,
    required this.text,
    required this.value,
  }) : super(key: key);

  final String text;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: subTitleStyleTotal,
        ),
        Text(value, style: valueStyle)
      ],
    );
  }
}
