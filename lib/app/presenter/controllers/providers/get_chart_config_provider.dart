import 'package:everest_crypto/app/data/datasources/get_chart_config_datasource.dart';
import 'package:everest_crypto/app/data/repositories/get_chart_config_repository_imp.dart';
import 'package:everest_crypto/app/domain/usecases/get_chart_config_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entities/chart_config_entity.dart';
import '../notifiers/get_chart_config_notifier.dart';

final chartConfigDatasource = Provider(
  (ref) => GetChartConfigDatasource(),
);

final chartConfigRepository = Provider(
  (ref) => GetChartConfigRepositoryImp(ref.watch(chartConfigDatasource)),
);

final chartConfigUsecase = Provider(
    (ref) => GetChartConfigUsecaseImp(ref.watch(chartConfigRepository)));

final chartConfigProvider =
    StateNotifierProvider<GetChartConfigNotifier, ChartConfigEntity>(
  (ref) => GetChartConfigNotifier(ref.watch(chartConfigUsecase)),
);
