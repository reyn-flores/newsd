import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:newsd/src/data/datasource/news_api_service.dart';
import 'package:newsd/src/data/repositories/api_repository_impl.dart';
import 'package:newsd/src/domain/repositories/api_repository.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
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
