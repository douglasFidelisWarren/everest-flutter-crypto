import 'package:dio/dio.dart';
import 'package:everest_crypto/app/data/datasources/api/endpoints/gencko_endpoints.dart';
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

  test("""WHEN getAllCoins is requested by CoinRepositoryImp 
      THEN getAllCoins from GenckoEndpoints is called""", () async {
    when((() => genckoEndpointsMock.getAllCoins("brl"))).thenAnswer((_) async =>
        Response(
            data: ApiFactory.getAllCoins("brl"),
            requestOptions: RequestOptions(path: faker.internet.httpUrl())));
    await coinRepositoryImp.getAllCoins("brl");
    verify(() => genckoEndpointsMock.getAllCoins("brl")).called(1);
  });
}
