import 'package:dio/dio.dart';
import 'package:everest_crypto/app/data/datasources/api/endpoints/gencko_endpoints.dart';
import 'package:everest_crypto/app/data/repositories/coin_repository_imp.dart';
import 'package:everest_crypto/app/domain/repositories/i_coin_repository.dart';
import 'package:everest_crypto/app/domain/usecases/get_all_coins_usecase.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/api_factory.dart';

class GenckoEndpointsMock extends Mock implements GenckoEndpoints {}

void main() {
  late GenckoEndpointsMock genckoEndpointsMock;
  late ICoinRepository iCoinRepository;
  late IGetAllCoinsUsecase sut;

  setUp(() {
    genckoEndpointsMock = GenckoEndpointsMock();
    iCoinRepository = CoinRepositoryImp(genckoEndpoint: genckoEndpointsMock);
    sut = GetAllCoinsUsecaseImp(iCoinRepository);
  });

  test("""WHEN getAllCoins is requested by GetAllCoinsUsecaseImp 
      THEN return List<CoinViewData>""", (() async {
    when((() => genckoEndpointsMock.getAllCoins("brl"))).thenAnswer((_) async =>
        Response(
            data: ApiFactory.getAllCoins("brl"),
            requestOptions: RequestOptions(path: faker.internet.httpUrl())));
    final wallet = await sut.getAllCoins("brl");
    expect(wallet.isNotEmpty, true);
  }));
}
