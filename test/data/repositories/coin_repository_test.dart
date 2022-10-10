import 'package:dio/dio.dart';
import 'package:everest_crypto/app/data/datasources/api/endpoints/gencko_endpoints.dart';
import 'package:everest_crypto/app/data/repositories/coin_prices_repository_imp.dart';
import 'package:everest_crypto/app/data/repositories/coin_repository_imp.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/api_factory.dart';

class GenckoEndpointsMock extends Mock implements GenckoEndpoints {}

void main() {
  late GenckoEndpointsMock genckoEndpointsMock;
  late CoinRepositoryImp coinRepositoryImp;
  setUp(() {
    genckoEndpointsMock = GenckoEndpointsMock();
    coinRepositoryImp = CoinRepositoryImp(genckoEndpoint: genckoEndpointsMock);
  });

  test("""WHEN getCoinPrices is requested by CoinPricesRepositoryImp 
      THEN getCoinPrices from GenckoEndpoints is called""", () async {
    when((() => genckoEndpointsMock.getAllCoins(""))).thenAnswer((_) async =>
        Response(
            data: ApiFactory.getAllCoins(),
            requestOptions: RequestOptions(path: faker.internet.httpUrl())));
    await coinRepositoryImp.getAllCoins("");
    verify(() => genckoEndpointsMock.getAllCoins("")).called(1);
  });
}
