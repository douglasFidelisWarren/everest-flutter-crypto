// import 'package:decimal/decimal.dart';
// import 'package:dio/dio.dart';
// import 'package:everest_crypto/app/data/repositories/wallet_repository_imp.dart';
// import 'package:everest_crypto/app/domain/entities/coins_view_data.dart';
// import 'package:everest_crypto/app/domain/entities/exchange_entity.dart';
// import 'package:everest_crypto/app/domain/repositories/i_wallet_repository.dart';
// import 'package:everest_crypto/app/domain/usecases/convert_coin_usecase.dart';
// import 'package:everest_crypto/app/domain/usecases/get_wallet_usecase.dart';
// import 'package:faker/faker.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';

// import '../../data/repositories/coin_prices_repository_test.dart';
// import '../../helpers/api_factory.dart';
// import '../../helpers/fake_repo.dart';

// void main() {
//   late GenckoEndpointsMock genckoEndpointsMock;
//   late GetWalletUsecaseImp getWalletUsecase;
//   late WalletRepositoryImp walletRepository;
//   late Map<String, Decimal> userCoin;
//   late String vsCoin;

//   setUp(() async {
//     genckoEndpointsMock = GenckoEndpointsMock();
//     walletRepository = WalletRepositoryImp(genckoEndpointsMock);
//     getWalletUsecase = GetWalletUsecaseImp(walletRepository);
//     userCoin = {"bitcoin": Decimal.parse("1")};
//     vsCoin = "brl";
//   });

//   test("""WHEN getCoinPrices is requested by CoinPricesRepositoryImp
//       THEN getCoinPrices from GenckoEndpoints is called""", () async {
//     // when((() => genckoEndpointsMock.getCoinsWallet({}, ""))).thenAnswer(
//     //     (_) async => Response(
//     //         data: ApiFactory.getCoinsWallet(),
//     //         requestOptions: RequestOptions(path: faker.internet.httpUrl())));
//     // await getWalletUsecase.getCoinsWallet({}, "");
//     verify(() => genckoEndpointsMock.getCoinsWallet({}, "")).called(1);
//     final teste = await getWalletUsecase.getCoinsWallet(userCoin, vsCoin);
//     expect(teste.isNotEmpty, equals(true));
//   });
// }

import 'package:dio/dio.dart';
import 'package:everest_crypto/app/data/datasources/api/endpoints/gencko_endpoints.dart';
import 'package:everest_crypto/app/data/repositories/wallet_repository_imp.dart';
import 'package:everest_crypto/app/domain/repositories/i_wallet_repository.dart';
import 'package:everest_crypto/app/domain/usecases/get_wallet_usecase.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/api_factory.dart';

class GenckoEndpointsMock extends Mock implements GenckoEndpoints {}

void main() {
  late GenckoEndpointsMock genckoEndpointsMock;
  late IWalletRepository walletRepository;
  late IGetWalletUsecase sut;

  setUp(() {
    genckoEndpointsMock = GenckoEndpointsMock();
    walletRepository = WalletRepositoryImp(genckoEndpointsMock);
    sut = GetWalletUsecaseImp(walletRepository);
  });

  test(
      'WHEN getWallet and execute is requested by GetCryptosDataUseCase, THEN ensure call getWallet and execute from GetCryptosDataUseCase',
      (() async {
    when((() => genckoEndpointsMock.getCoinsWallet())).thenAnswer((_) async =>
        Response(
            data: ApiFactory.getCoinsWallet(),
            requestOptions: RequestOptions(path: faker.internet.httpUrl())));

    final wallet = await sut.getCoinsWallet(
        // {"bitcoin": Decimal.parse("5.65456841")}, "brl"
        );

    expect(wallet.isNotEmpty, true);
  }));
}
