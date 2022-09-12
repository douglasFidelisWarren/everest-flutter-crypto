import 'package:flutter/material.dart';

import '../../shared/formater.dart';
import '../../shared/styles.dart';

class HideableText extends StatelessWidget {
  const HideableText({
    Key? key,
    required this.value,
    required this.visible,
  }) : super(key: key);

  final double value;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    Decoration hideText = BoxDecoration(
      color: visible ? colorHideOff : colorHideOn,
      borderRadius: BorderRadius.circular(5),
    );
    return Container(
      decoration: hideText,
      child: Text(
        "R\$ ${number.format(value)}",
        style: visible ? valueStyle : valueStyleHide,
      ),
    );
  }
}
