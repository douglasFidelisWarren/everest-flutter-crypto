import 'package:everest_crypto/app/data/datasources/api/endpoints/gencko_endpoints.dart';
import 'package:everest_crypto/app/data/datasources/get_chart_config_datasource.dart';
import 'package:everest_crypto/app/data/repositories/chart_config_repository_imp.dart';
import 'package:everest_crypto/app/domain/repositories/i_chart_config_repository.dart';
import 'package:everest_crypto/app/domain/usecases/get_chart_config_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../helpers/fake_repo.dart';

class GenckoEndpointsMock extends Mock implements GenckoEndpoints {}

void main() {
  late GetChartConfigDatasource datasource;
  late FakeRepo repo;
  late IChartConfigRepository repository;
  late IGetChartConfigUsecase sut;
  late double max;

  setUp(() {
    repo = FakeRepo();
    datasource = GetChartConfigDatasource();
    repository = ChartConfigRepositoryImp(datasource);
    sut = GetChartConfigUsecaseImp(repository);
    max = sut.getChartConfig(repo.getPrices()).max;
  });

  test("""WHEN getChartConfig is requested by GetChartConfigUsecaseImp 
      THEN return ChartConfigViewData""", (() {
    final config = sut.getChartConfig(repo.getPrices());
    expect(config.max, max);
  }));
}
