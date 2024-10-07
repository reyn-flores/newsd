import 'package:newsd/data/base/base_api_repository.dart';
import 'package:newsd/data/datasource/remote/news_api_service.dart';
import 'package:newsd/domain/models/requests/breaking_news_request.dart';
import 'package:newsd/domain/models/requests/news_request.dart';
import 'package:newsd/domain/models/responses/breaking_news_response.dart';
import 'package:newsd/domain/models/responses/news_response.dart';
import 'package:newsd/domain/repositories/api_repository.dart';
import 'package:newsd/core/resources/data_state.dart';

class ApiRepositoryImpl extends BaseApiRepository implements ApiRepository {
  final NewsApiService _newsApiService;

  ApiRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<BreakingNewsResponse>> getBreakingNews(
      {required BreakingNewsRequest request}) {
    return getStateOf(
      request: () => _newsApiService.getBreakingNews(
        apiKey: request.apiKey,
        country: request.country,
        category: request.category,
        page: request.page,
        pageSize: request.pageSize,
      ),
    );
  }

  @override
  Future<DataState<NewsResponse>> getNews({required NewsRequest request}) {
    return getStateOf(
      request: () => _newsApiService.getNews(
        apiKey: request.apiKey,
        q: request.q,
        searchIn: request.searchIn,
        sortBy: request.sortBy,
        page: request.page,
        pageSize: request.pageSize,
      ),
    );
  }
}
