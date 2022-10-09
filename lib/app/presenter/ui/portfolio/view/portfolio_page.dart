import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/entities/coins_view_data.dart';
import '../widgets/page_body.dart';

class PortfolioPage extends ConsumerWidget {
  const PortfolioPage({Key? key, required this.coins}) : super(key: key);

  static const route = '/portfolio';
  final List<CoinViewData> coins;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: PageBody(coins: coins),
    );
  }
}
