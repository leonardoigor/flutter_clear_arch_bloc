import 'package:cleanArchitecture/modules/search/domain/entities/result_search.dart';
import 'package:cleanArchitecture/modules/search/domain/erros/errors.dart';
import 'package:cleanArchitecture/modules/search/domain/usecases/search_by_text.dart';
import 'package:cleanArchitecture/modules/search/presenter/search/search_bloc.dart';
import 'package:cleanArchitecture/modules/search/presenter/search/states/state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchByTextMock extends Mock implements SearchByText {}

main() {
  final useCase = SearchByTextMock();
  final bloc = SearchBloc(useCase);

  test('deve retorna os estados na ordem correta', () {
    when(useCase.call(any))
        .thenAnswer((realInvocation) async => Right(<ResultSearch>[]));
    expect(
        bloc,
        emitsInOrder([
          isA<SearchLoading>(),
          isA<SearchSucces>(),
        ]));
    bloc.add('igor');
  });
  test('deve retorna um errror', () {
    when(useCase.call(any))
        .thenAnswer((realInvocation) async => Left(InvalidTextError()));
    expect(
        bloc,
        emitsInOrder([
          isA<SearchLoading>(),
          isA<SearchError>(),
        ]));
    bloc.add('igor');
  });
}
