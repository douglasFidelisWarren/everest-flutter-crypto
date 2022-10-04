import 'package:flutter/material.dart';

import '../../shared/styles.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({
    Key? key,
    required this.description,
    required this.value,
  }) : super(key: key);

  final String description;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Divider(
            height: 0,
            thickness: 1,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                description,
                style: subTitleStyleMediun,
              ),
              Text(
                value,
                style: mediunConvertBlack,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
