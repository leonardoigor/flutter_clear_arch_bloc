import 'package:cleanArchitecture/modules/search/domain/entities/result_search.dart';
import 'package:cleanArchitecture/modules/search/domain/erros/errors.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepository {
  Future<Either<FailureSearch, List<ResultSearch>>> search(String searchText);
}
