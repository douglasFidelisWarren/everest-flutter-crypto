import 'package:decimal/decimal.dart';
import 'package:everest_crypto/app/domain/entities/coin_entity.dart';

import '../../data/datasources/wallet_datasource.dart';

class WalletController {
  WalletDatasource teste = WalletDatasource();
  double getWallet() {
    Decimal wallet = Decimal.parse("0");
    List<CoinEntity> coinList = teste.getCoinsWallet();

    for (var coin in coinList) {
      wallet = wallet + (coin.amount) * (coin.latest);
    }

    return wallet.toDouble();
  }
}
