import 'package:dio/dio.dart';
import 'package:newsd/domain/models/responses/breaking_news_response.dart';
import 'package:newsd/domain/models/responses/news_response.dart';
import 'package:newsd/core/constants/strings.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: baseUrl, parser: Parser.MapSerializable)
abstract class NewsApiService {
  factory NewsApiService(Dio dio, {String baseUrl}) = _NewsApiService;

  @GET('/everything')
  Future<HttpResponse<NewsResponse>> getNews({
    @Query("apiKey") String? apiKey,
    @Query("q") String? q,
    @Query("searchIn") String? searchIn,
    @Query("sortBy") String? sortBy,
    @Query("page") int? page,
    @Query("pageSize") int? pageSize,
  });

  @GET('/top-headlines')
  Future<HttpResponse<BreakingNewsResponse>> getBreakingNews({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
    @Query("page") int? page,
    @Query("pageSize") int? pageSize,
  });
}
