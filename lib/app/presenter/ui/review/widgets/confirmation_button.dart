// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../l10n/core_strings.dart';
import '../../../../domain/entities/exchange_entity.dart';
import '../../../controllers/providers/conversion_provider.dart';
import '../../conversion/view/success_page.dart';
import '../../shared/styles.dart';

class ConfirmationButton extends ConsumerWidget {
  const ConfirmationButton({
    Key? key,
    required this.currentExchange,
  }) : super(key: key);

  final ExchangeViewData currentExchange;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double sizeH = MediaQuery.of(context).size.height;
    double sizeW = MediaQuery.of(context).size.width;
    return MaterialButton(
      key: const Key("confirmButton"),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      color: ref.watch(animateProvider) ? colorBrandWarren : Colors.white,
      onPressed: () async {
        ref.read(exchangesListProvider).add(currentExchange);
        ref.read(animateProvider.state).state = false;
        await Future.delayed(const Duration(milliseconds: 2000));
        Navigator.of(context).pushReplacementNamed(SuccessPage.route);
      },
      child: AnimatedContainer(
        alignment:
            ref.watch(animateProvider) ? Alignment.center : Alignment.topCenter,
        width: ref.watch(animateProvider) ? sizeW * .8 : sizeW,
        height: ref.watch(animateProvider) ? 45 : sizeH * .45,
        duration: const Duration(milliseconds: 1500),
        curve: Curves.easeOutCirc,
        child: ref.watch(animateProvider)
            ? Center(
                child: Text(
                  CoreStrings.of(context)!.converCoin,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              )
            : const CircleAvatar(
                radius: 35,
                backgroundColor: Color.fromARGB(255, 214, 255, 223),
                child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 12, 95, 44)),
              ),
      ),
    );
  }
}
