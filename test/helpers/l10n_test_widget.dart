import 'package:everest_crypto/l10n/core_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class L10nTestWidget extends ConsumerWidget {
  const L10nTestWidget({Key? key, required this.locale}) : super(key: key);
  final Locale locale;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      child: MaterialApp(
        locale: locale,
        supportedLocales: CoreStrings.supportedLocales,
        localizationsDelegates: const [
          CoreStrings.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: Scaffold(
          body: Consumer(
            builder: (context, ref, child) {
              return Column(
                children: [
                  Text(CoreStrings.of(context)!.crypto),
                  Text(CoreStrings.of(context)!.walletTotalAmount),
                  Text(CoreStrings.of(context)!.portfolio),
                  Text(CoreStrings.of(context)!.purchase),
                  Text(CoreStrings.of(context)!.availableCoins),
                  Text(CoreStrings.of(context)!.noMovements),
                  Text(CoreStrings.of(context)!.details),
                  Text(CoreStrings.of(context)!.currentPrice),
                  Text(CoreStrings.of(context)!.percentVariation),
                  Text(CoreStrings.of(context)!.days),
                  Text(CoreStrings.of(context)!.detailsAmount),
                  Text(CoreStrings.of(context)!.value),
                  Text(CoreStrings.of(context)!.converCoin),
                  Text(CoreStrings.of(context)!.convertTitle),
                  Text(CoreStrings.of(context)!.balanceAvailable),
                  //=> '';
                  Text(CoreStrings.of(context)!.insufficient),
                  // => '';
                  Text(CoreStrings.of(context)!.convertQuery),
                  // => '';
                  Text(CoreStrings.of(context)!.estimatedTotal),
                  //=> '';
                  Text(CoreStrings.of(context)!.reviewTitle),
                  //=> '';
                  Text(CoreStrings.of(context)!.reviewAlert),
                  // => '';

                  // => '';
                  Text(CoreStrings.of(context)!.receive),
                  // => '';
                  Text(CoreStrings.of(context)!.exchange),
                  // => '';
                  Text(CoreStrings.of(context)!.convertConfirmTitle),
                  // => '';
                  Text(CoreStrings.of(context)!.convertConfirmSubtitle),
                  // => '';
                  Text(CoreStrings.of(context)!.movementsTitle),
                  // => '';
                  Text(CoreStrings.of(context)!.movementReceipt),
                  // => '';
                  Text(CoreStrings.of(context)!.documentNumber),
                  //=> '';
                  Text(CoreStrings.of(context)!.date),
                  // => '';
                  Text(CoreStrings.of(context)!.debtCoin),
                  //=> '';
                  Text(CoreStrings.of(context)!.creditCoin),
                  // => '';
                  Text(CoreStrings.of(context)!.movementValue),
                  //=> '';
                  Text(CoreStrings.of(context)!.rateValue),
                  // => '';
                  Text(CoreStrings.of(context)!.receiptShare),
                  //=> '';
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
