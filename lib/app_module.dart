import 'package:cleanArchitecture/app_widget.dart';
import 'package:cleanArchitecture/modules/search/domain/usecases/search_by_text.dart';
import 'package:cleanArchitecture/modules/search/extenal/datasouces/github_datasource.dart';
import 'package:cleanArchitecture/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:cleanArchitecture/modules/search/presenter/search/search_bloc.dart';
import 'package:cleanArchitecture/modules/search/presenter/search/search_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SearchByTextImp(i())),
        Bind((i) => SearchRepositoryImpl(i())),
        Bind((i) => GitHubatasource(i())),
        Bind((i) => SearchBloc(i())),
        Bind((i) => Dio()),
      ];

  @override
  List<Router> get routers => [
        Router(
          '/',
          child: (_, __) => SearchPage(),
        )
      ];

  @override
  Widget get bootstrap => AppWidget();
}
