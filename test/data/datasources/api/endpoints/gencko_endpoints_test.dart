import 'package:decimal/decimal.dart';
import 'package:dio/dio.dart';
import 'package:everest_crypto/app/data/datasources/api/endpoints/gencko_endpoints.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/api_factory.dart';

class DioMock extends Mock implements Dio {}

void main() {
  late Response<List<Map<String, dynamic>>> sucess;
  late DioMock dioMock;
  late GenckoEndpoints genckoEndpoints;

  When mockGetResponse() => when(
      () => dioMock.get(any(), queryParameters: any(named: 'queryParameters')));

  mockResponse(List<Map<String, dynamic>> factory, int statusCode) => Response(
      data: factory,
      statusCode: statusCode,
      requestOptions: RequestOptions(path: faker.internet.httpUrl()));

  setUp(() {
    dioMock = DioMock();
    genckoEndpoints = GenckoEndpoints(dioMock);
  });

  setUp(() {
    sucess = mockResponse(ApiFactory.getCoinsWallet(), 200);
  });
  test('WHEN getAllTransactions is requested THEN returns 200', (() async {
    mockGetResponse().thenAnswer((_) async => sucess);
    final getCoinsWallet = await genckoEndpoints.getCoinsWallet({}, "");
    final getPrices = await genckoEndpoints.getCoinPrices("", "", 0);
    final getCoinConverction =
        await genckoEndpoints.getCoinConverction(coinId: "", vScurrency: "");
    expect(getCoinsWallet.statusCode, equals(200));
    expect(getPrices, sucess);
    expect(getCoinConverction, sucess);
  }));
}
