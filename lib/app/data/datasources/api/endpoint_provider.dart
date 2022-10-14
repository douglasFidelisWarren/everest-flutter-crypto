import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'endpoints/gencko_endpoints.dart';

final genckoEndpointProvider = Provider((ref) {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.coingecko.com/api/v3',
  ));
  return GenckoEndpoints(dio);
});
