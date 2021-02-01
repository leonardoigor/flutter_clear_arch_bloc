import 'package:cleanArchitecture/modules/search/domain/erros/errors.dart';
import 'package:cleanArchitecture/modules/search/infra/datasources/search_datasource.dart';
import 'package:cleanArchitecture/modules/search/infra/models/result_search_model.dart';
import 'package:dio/dio.dart';

extension on String {
  String normalize() {
    return this.replaceAll(' ', '+');
  }
}

class GitHubatasource implements SearchDataSource {
  final Dio dio;

  GitHubatasource(this.dio);
  @override
  Future<List<ResultSearchModel>> getSearch(String searchText) async {
    final url =
        'https://api.github.com/search/users?q=${searchText.normalize()}';
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      List<ResultSearchModel> list = (response.data['items'] as List)
          .map((e) => ResultSearchModel.fromMap(e))
          .toList();
      return list;
    } else {
      throw DatasourceError();
    }
  }
}
