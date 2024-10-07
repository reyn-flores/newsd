import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:newsd/data/datasource/local/app_database.dart';
import 'package:newsd/data/datasource/remote/news_api_service.dart';
import 'package:newsd/data/repositories/api_repository_impl.dart';
import 'package:newsd/data/repositories/database_repository_impl.dart';
import 'package:newsd/domain/repositories/api_repository.dart';
import 'package:newsd/domain/repositories/database_repository.dart';
import 'package:newsd/core/constants/strings.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // local datasource
  final db = await $FloorAppDatabase.databaseBuilder(databaseName).build();
  getIt.registerSingleton(db);

  getIt.registerSingleton<DatabaseRepository>(
    DatabaseRepositoryImpl(getIt<AppDatabase>()),
  );

  // remote datasource
  final dio = Dio();
  dio.interceptors.add(AwesomeDioInterceptor());

  getIt.registerSingleton<Dio>(dio);
  getIt.registerSingleton<NewsApiService>(
    NewsApiService(getIt<Dio>()),
  );
  getIt.registerSingleton<ApiRepository>(
    ApiRepositoryImpl(getIt<NewsApiService>()),
  );
}
