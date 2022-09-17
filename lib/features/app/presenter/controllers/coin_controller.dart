import 'package:dio/dio.dart';
import 'package:everest_crypto/features/app/data/datasources/coin_datasource_implementation.dart';
import 'package:everest_crypto/features/app/data/repositories/coin_repository_implementation.dart';
import 'package:everest_crypto/features/app/domain/entities/coin_entity.dart';
import 'package:everest_crypto/features/app/domain/usecases/get_all_coins_usecase.dart';
import 'package:everest_crypto/features/app/presenter/controllers/coin_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dioProvider = Provider((ref) => Dio());

final coinDatasourceProvider = Provider((ref) {
  return CoinDatasourceImplementation(ref.watch(dioProvider));
});

final coinRepositoryProvider = Provider((ref) {
  return CoinRepositoryImplementation(ref.watch(coinDatasourceProvider));
});

final coinUsecaseProvider = Provider((ref) {
  return GetAllCoinsUsecaseImp(ref.watch(coinRepositoryProvider));
});

final coinsNotifierProvider =
    StateNotifierProvider<CoinNotifier, List<CoinEntity>>((ref) {
  return CoinNotifier(ref.watch(coinUsecaseProvider));
});
