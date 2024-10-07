import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:newsd/domain/models/article.dart';
import 'package:newsd/domain/models/requests/breaking_news_request.dart';
import 'package:newsd/domain/repositories/api_repository.dart';
import 'package:newsd/presentation/cubits/base/base_cubit.dart';
import 'package:newsd/core/resources/data_state.dart';

part 'breaking_news_state.dart';

class BreakingNewsCubit extends BaseCubit<BreakingNewsState, List<Article>> {
  final ApiRepository _apiRepository;

  BreakingNewsCubit(this._apiRepository)
      : super(const BreakingNewsLoading(), []);

  Future<void> getBreakingNews() async {
    final response = await _apiRepository.getBreakingNews(
      request: BreakingNewsRequest(),
    );

    if (response is DataSuccess) {
      final articles = response.data!.articles;
      data.addAll(articles);
      emit(
        BreakingNewsSuccess(articles: data),
      );
    } else if (response is DataFailed) {
      emit(
        BreakingNewsFailed(error: response.error),
      );
    }
  }
}
