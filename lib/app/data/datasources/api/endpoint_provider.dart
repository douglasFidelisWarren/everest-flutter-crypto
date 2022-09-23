import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'gencko_endpoints.dart';

final getCoinsEndpointProvider = Provider((ref) {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.coingecko.com/api/v3',
  ));
  return GenckoEndpoints(dio);
});
