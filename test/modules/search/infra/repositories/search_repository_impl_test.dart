import 'package:cleanArchitecture/modules/search/domain/erros/errors.dart';
import 'package:cleanArchitecture/modules/search/infra/datasources/search_datasource.dart';
import 'package:cleanArchitecture/modules/search/infra/models/result_search_model.dart';
import 'package:cleanArchitecture/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchDataSourceMock extends Mock implements SearchDataSource {}

main() {
  final dataSource = SearchDataSourceMock();
  final repository = SearchRepositoryImpl(dataSource);

  test('Deve retornar uma lissta de ResutSearch', () async {
    when(dataSource.getSearch(any))
        .thenAnswer((realInvocation) async => <ResultSearchModel>[]);

    final result = await repository.search('searchText');

    expect(result | null, isA<List<ResultSearchModel>>());
  });
  test('Deve retornar um error se o datasource falhar', () async {
    when(dataSource.getSearch(any)).thenThrow(Exception());

    final result = await repository.search('searchText');

    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
