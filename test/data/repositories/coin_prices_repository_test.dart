import 'package:dio/dio.dart';
import 'package:everest_crypto/app/data/datasources/api/endpoints/gencko_endpoints.dart';
import 'package:everest_crypto/app/data/repositories/coin_prices_repository_imp.dart';
import 'package:everest_crypto/app/presenter/ui/shared/home.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../helpers/api_factory.dart';
import '../../helpers/test_app_widget.dart';

class GenckoEndpointsMock extends Mock implements GenckoEndpoints {}

void main() {
  late GenckoEndpointsMock genckoEndpointsMock;
  late CoinPricesRepositoryImp coinPricesRepositoryImp;
  setUp(() {
    genckoEndpointsMock = GenckoEndpointsMock();
    coinPricesRepositoryImp = CoinPricesRepositoryImp(genckoEndpointsMock);
  });

  test("""WHEN getCoinPrices is requested by CoinPricesRepositoryImp 
      THEN getCoinPrices from GenckoEndpoints is called""", () async {
    when((() => genckoEndpointsMock.getCoinPrices("", "", 0))).thenAnswer(
        (_) async => Response(
            data: ApiFactory.getPrices(),
            requestOptions: RequestOptions(path: faker.internet.httpUrl())));
    await coinPricesRepositoryImp.getCoinPrices("", "", 0);
    verify(() => genckoEndpointsMock.getCoinPrices("", "", 0)).called(1);
  });
}
