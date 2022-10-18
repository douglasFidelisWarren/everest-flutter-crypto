import 'package:everest_crypto/app/presenter/ui/shared/custom_app_bar.dart';
import 'package:everest_crypto/app/presenter/ui/shared/home.dart';
import 'package:everest_crypto/l10n/core_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/entities/coins_view_data.dart';
import '../../../controllers/providers/get_coins_wallet_provider.dart';
import '../widgets/page_body.dart';

final pageControllerProvider = StateProvider<PageController>(
  (ref) => PageController(initialPage: ref.watch(currentPageProvider)),
);
final currentPageProvider = StateProvider<int>(
  (ref) => 0,
);

class PortfolioPage extends ConsumerWidget {
  const PortfolioPage({
    Key? key,
  }) : super(key: key);

  static const route = '/portfolio';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavBar(index: 0),
      appBar: CustomAppBar(CoreStrings.of(context)!.portfolio),
      body: PageBody(coins: ref.watch(coinsWalletProvider).value ?? []),
    );
  }
}
