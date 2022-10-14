import 'package:decimal/decimal.dart';
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

  test("""WHEN getCoinsWallet is requested by GetWalletUsecaseImp 
      THEN return List<CoinViewData>""", (() async {
    when((() => genckoEndpointsMock
            .getCoinsWallet({"bitcoin": Decimal.parse("1")}, "brl")))
        .thenAnswer((_) async => Response(
            data: ApiFactory.getCoinsWallet(),
            requestOptions: RequestOptions(path: faker.internet.httpUrl())));
    final wallet =
        await sut.getCoinsWallet({"bitcoin": Decimal.parse("1")}, "brl");
    expect(wallet.isNotEmpty, true);
  }));
}
