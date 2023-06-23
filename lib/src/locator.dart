import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:newsd/src/data/datasource/local/app_database.dart';
import 'package:newsd/src/data/datasource/remote/news_api_service.dart';
import 'package:newsd/src/data/repositories/api_repository_impl.dart';
import 'package:newsd/src/data/repositories/database_repository_impl.dart';
import 'package:newsd/src/domain/repositories/api_repository.dart';
import 'package:newsd/src/domain/repositories/database_repository.dart';
import 'package:newsd/src/utils/constants/strings.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  // local datasource
  final db = await $FloorAppDatabase.databaseBuilder(databaseName).build();
  locator.registerSingleton(db);

  locator.registerSingleton<DatabaseRepository>(
    DatabaseRepositoryImpl(locator<AppDatabase>()),
  );

  // remote datasource
  final dio = Dio();
  dio.interceptors.add(AwesomeDioInterceptor());

  locator.registerSingleton<Dio>(dio);
  locator.registerSingleton<NewsApiService>(
    NewsApiService(locator<Dio>()),
  );
  locator.registerSingleton<ApiRepository>(
    ApiRepositoryImpl(locator<NewsApiService>()),
  );
}
