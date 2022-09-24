// import 'package:decimal/decimal.dart';
// import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';

// import '../../data/datasources/wallet_datasource.dart';

// class WalletController {  
//   double getWallet() {
//     Decimal wallet = Decimal.parse("0");
//     List<CoinViewData> coinList = walletDataSource.getCoinsWallet();

//     for (var coin in coinList) {
//       wallet = wallet + (Decimal.parse("3") * coin.currentPrice);
//     }
//     return wallet.toDouble();
//   }
// }
