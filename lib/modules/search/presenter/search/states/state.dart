import 'package:cleanArchitecture/modules/search/domain/entities/result_search.dart';
import 'package:cleanArchitecture/modules/search/domain/erros/errors.dart';

abstract class SearchState {}

class SearchSucces implements SearchState {
  final List<ResultSearch> list;

  SearchSucces(this.list);
}

class SearchError implements SearchState {
  final FailureSearch error;

  SearchError(this.error);
}

class SearchLoading implements SearchState {}

class SearchStart implements SearchState {}
