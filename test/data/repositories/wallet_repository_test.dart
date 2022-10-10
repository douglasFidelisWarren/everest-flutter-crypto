import 'package:decimal/decimal.dart';
import 'package:dio/dio.dart';
import 'package:everest_crypto/app/data/datasources/api/endpoints/gencko_endpoints.dart';
import 'package:everest_crypto/app/data/repositories/coin_prices_repository_imp.dart';
import 'package:everest_crypto/app/data/repositories/coin_repository_imp.dart';
import 'package:everest_crypto/app/data/repositories/wallet_repository_imp.dart';
import 'package:everest_crypto/app/domain/repositories/i_wallet_repository.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/api_factory.dart';

class GenckoEndpointsMock extends Mock implements GenckoEndpoints {}

void main() {
  late GenckoEndpointsMock genckoEndpointsMock;
  late IWalletRepository walletRepositoryImp;
  setUp(() {
    genckoEndpointsMock = GenckoEndpointsMock();
    walletRepositoryImp = WalletRepositoryImp(genckoEndpointsMock);
  });

  test("""WHEN getAllCoins is requested by CoinRepositoryImp 
      THEN getAllCoins from GenckoEndpoints is called""", () async {
    when((() => genckoEndpointsMock.getCoinsWallet())).thenAnswer((_) async =>
        Response(
            data: ApiFactory.getCoinsWallet(),
            requestOptions: RequestOptions(path: faker.internet.httpUrl())));
    await walletRepositoryImp.getCoinsWallet();
    verify(() => genckoEndpointsMock.getCoinsWallet()).called(1);
  });
}
