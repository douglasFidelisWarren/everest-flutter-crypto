import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/datasources/get_chart_config_datasource.dart';
import '../../../data/repositories/get_chart_config_repository_imp.dart';
import '../../../domain/entities/chart_config_entity.dart';
import '../../../domain/usecases/get_chart_config_usecase.dart';
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
