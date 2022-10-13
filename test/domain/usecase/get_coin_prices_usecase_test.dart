import 'package:dio/dio.dart';
import 'package:everest_crypto/app/data/datasources/api/endpoints/gencko_endpoints.dart';
import 'package:everest_crypto/app/data/repositories/coin_prices_repository_imp.dart';
import 'package:everest_crypto/app/domain/repositories/i_coin_prices_repository.dart';
import 'package:everest_crypto/app/domain/usecases/get_coin_prices_usecase.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/api_factory.dart';

class GenckoEndpointsMock extends Mock implements GenckoEndpoints {}

void main() {
  late GenckoEndpointsMock genckoEndpointsMock;
  late ICoinPricesRepository repository;
  late IGetCoinPricesUsecase sut;

  setUp(() {
    genckoEndpointsMock = GenckoEndpointsMock();
    repository = CoinPricesRepositoryImp(genckoEndpointsMock);
    sut = GetCoinPricesUsecaseImp(repository);
  });

  test("""WHEN getCoinPrices is called by GetCoinPricesUsecaseImp 
      THEN return Future<List<Decimal>>""", (() async {
    when((() => genckoEndpointsMock.getCoinPrices("", "", 0))).thenAnswer(
        (_) async => Response(
            data: ApiFactory.getPrices(),
            requestOptions: RequestOptions(path: faker.internet.httpUrl())));
    final wallet = await sut.getCoinPrices(coinId: "", days: 0, vScurrency: "");
    expect(wallet.isNotEmpty, true);
  }));
}
