import 'package:cleanArchitecture/modules/search/domain/erros/errors.dart';
import 'package:cleanArchitecture/modules/search/domain/entities/result_search.dart';
import 'package:cleanArchitecture/modules/search/domain/repositories/search_repository.dart';
import 'package:cleanArchitecture/modules/search/infra/datasources/search_datasource.dart';
import 'package:dartz/dartz.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDataSource dataSource;

  SearchRepositoryImpl(this.dataSource);
  @override
  Future<Either<FailureSearch, List<ResultSearch>>> search(
      String searchText) async {
    try {
      final result = await dataSource.getSearch(searchText);

      return Right(result);
    } on DatasourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
