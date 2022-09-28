import 'package:flutter/material.dart';

import '../../shared/styles.dart';

class VisibilityButton extends StatelessWidget {
  const VisibilityButton(
    this.changeVisibility,
    this.visible, {
    Key? key,
  }) : super(key: key);
  final Function changeVisibility;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => changeVisibility(),
      icon: Icon(
        visible ? Icons.visibility : Icons.visibility_off,
        color: colorBlackText,
        size: 28,
      ),
    );
  }
}
