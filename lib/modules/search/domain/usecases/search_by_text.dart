import 'package:cleanArchitecture/modules/search/domain/entities/result_search.dart';
import 'package:cleanArchitecture/modules/search/domain/erros/errors.dart';
import 'package:cleanArchitecture/modules/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';

abstract class SearchByText {
  Future<Either<FailureSearch, List<ResultSearch>>> call(String searchText);
}

class SearchByTextImp implements SearchByText {
  final SearchRepository repository;

  SearchByTextImp(this.repository);

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> call(
      String searchText) async {
    if (searchText == null || searchText.isEmpty) {
      return left(InvalidTextError());
    }
    return repository.search(searchText);
  }
}
