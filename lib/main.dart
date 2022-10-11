import 'package:everest_crypto/app/presenter/ui/available/view/available_page.dart';
import 'package:everest_crypto/app/presenter/ui/movements/view/movements_page.dart';
import 'package:everest_crypto/app/presenter/ui/portfolio/view/portfolio_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/domain/entities/coins_view_data.dart';
import 'app/presenter/controllers/providers/get_all_coins_provider.dart';
import 'app/presenter/controllers/providers/get_coins_wallet_provider.dart';
import 'l10n/core_strings.dart';

void main() {
  runApp(
    ProviderScope(
      child: Consumer(
        builder: (context, ref, child) {
          // List<CoinViewData> getWalletCoins() {
          //   List<CoinViewData> coins = [];
          //   List<CoinViewData> coinsProvider =
          //       ref.watch(coinsWalletProvider).value ?? [];
          //   for (var coin in coinsProvider) {
          //     coins.add(coin);
          //   }
          //   return coins;
          // }

          List<CoinViewData> getAvailableCoins() {
            List<CoinViewData> coins = [];
            List<CoinViewData> coinsProvider =
                ref.watch(getAllcoinsNotifierProvider).value ?? [];
            for (var coin in coinsProvider) {
              coins.add(coin);
            }
            return coins;
          }

          return MaterialApp(
            supportedLocales: CoreStrings.supportedLocales,
            localizationsDelegates: const [
              CoreStrings.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            theme: ThemeData(
                colorScheme: const ColorScheme.light(
              primary: Colors.black,
              secondary: Colors.black,
            )),
            debugShowCheckedModeBanner: false,
            initialRoute: PortfolioPage.route,
            onGenerateRoute: (settings) {
              final availableCoins = getAvailableCoins();
              // final walletCoins = getWalletCoins();
              if (settings.name == PortfolioPage.route) {
                return PageRouteBuilder(
                  pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) =>
                      PortfolioPage(),
                );
              } else if (settings.name == AvailablePage.route) {
                return PageRouteBuilder(
                    pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) =>
                        AvailablePage(coins: availableCoins));
              } else if (settings.name == MovementsPage.route) {
                return PageRouteBuilder(
                    pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) =>
                        const MovementsPage());
              }
              return null;
            },
          );
        },
      ),
    ),
  );
}
