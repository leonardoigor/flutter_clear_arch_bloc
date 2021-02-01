import 'package:cleanArchitecture/modules/search/domain/entities/result_search.dart';
import 'package:cleanArchitecture/modules/search/domain/erros/errors.dart';
import 'package:cleanArchitecture/modules/search/domain/repositories/search_repository.dart';
import 'package:cleanArchitecture/modules/search/domain/usecases/search_by_text.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {}

main() {
  final repository = SearchRepositoryMock();
  final userCase = SearchByTextImp(repository);
  test('deve retorna uma lista de resultSeach', () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(<ResultSearch>[]));
    final result = await userCase('teste');
    expect(result, isA<Right>());
    expect(result | null, isA<List<ResultSearch>>());
  });
  test('deve retorna uma Exception caso texto seja invalido', () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(<ResultSearch>[]));

    var result = await userCase(null);
    expect(result.fold(id, id), isA<InvalidTextError>());
    result = await userCase('');
    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}
