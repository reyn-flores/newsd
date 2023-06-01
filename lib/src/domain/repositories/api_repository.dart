import 'package:newsd/src/domain/models/requests/breaking_news_request.dart';
import 'package:newsd/src/domain/models/requests/news_request.dart';
import 'package:newsd/src/domain/models/responses/breaking_news_response.dart';
import 'package:newsd/src/domain/models/responses/news_response.dart';
import 'package:newsd/src/utils/resources/data_state.dart';

abstract class ApiRepository {
  Future<DataState<NewsResponse>> getNews({
    required NewsRequest request,
  });

  Future<DataState<BreakingNewsResponse>> getBreakingNews({
    required BreakingNewsRequest request,
  });
}
