import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'get_coins_endpoint.dart';

final getCoinsEndpointProvider = Provider((ref) {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.coingecko.com/api/v3',
  ));
  return GetCoinsEndpoint(dio);
});
