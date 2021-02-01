import 'dart:convert';

import 'package:cleanArchitecture/modules/search/domain/erros/errors.dart';
import 'package:cleanArchitecture/modules/search/extenal/datasouces/github_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../utils/github_response.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  final datasource = GitHubatasource(dio);
  test('Deve retornar uma lista de ResultSearchModel', () {
    when(dio.get(any)).thenAnswer((realInvocation) async =>
        Response(data: jsonDecode(githubResult), statusCode: 200));

    final future = datasource.getSearch('igor');

    expect(future, completes);
  });

  test('Deve retornar Um Error  se o codigo nao for 200', () {
    when(dio.get(any)).thenAnswer(
        (realInvocation) async => Response(data: null, statusCode: 401));

    final future = datasource.getSearch('igor');

    expect(future, throwsA(isA<DatasourceError>()));
  });
  test('Deve retornar Um Error  se ouver um erro no dio', () {
    when(dio.get(any)).thenThrow(Exception());

    final future = datasource.getSearch('igor');

    expect(future, throwsA(isA<Exception>()));
  });
}
