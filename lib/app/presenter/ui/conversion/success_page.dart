import 'package:everest_crypto/l10n/core_strings.dart';
import 'package:flutter/material.dart';

import '../../../../core/home.dart';
import '../shared/styles.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  static const route = '/success';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Row(
            children: [
              IconButton(
                  onPressed: () => Navigator.of(context)
                      .pushNamedAndRemoveUntil(Home.route, (route) => false),
                  icon: const Icon(Icons.close))
            ],
          ),
          const Divider(
            thickness: 1.5,
            color: colorGrayDivider,
          ),
          const SizedBox(
            height: 270,
          ),
          const Center(
            child: CircleAvatar(
              radius: 35,
              backgroundColor: Color.fromARGB(255, 214, 255, 223),
              child: Icon(
                Icons.check,
                color: Color.fromARGB(255, 12, 95, 44),
                size: 45,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            CoreStrings.of(context)!.convertConfirmTitle,
            style: totalStyle,
          ),
          Text(
            CoreStrings.of(context)!.convertConfirmSubtitle,
            style: smallGraySubTitle,
          ),
        ]),
      ),
    );
  }
}
