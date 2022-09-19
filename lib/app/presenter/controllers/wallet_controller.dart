import 'package:decimal/decimal.dart';
import 'package:everest_crypto/app/domain/entities/coin_entity.dart';

import '../../data/datasources/wallet_datasource.dart';

class WalletController {
  WalletDatasource walletDataSource = WalletDatasource();
  double getWallet() {
    Decimal wallet = Decimal.parse("0");
    List<CoinEntity> coinList = walletDataSource.getCoinsWallet();

    for (var coin in coinList) {
      wallet =
          wallet + (Decimal.parse(coin.amount)) * (Decimal.parse(coin.latest));
    }

    return wallet.toDouble();
  }
}
