import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:newsd/domain/models/article.dart';
import 'package:newsd/domain/models/requests/news_request.dart';
import 'package:newsd/domain/repositories/api_repository.dart';
import 'package:newsd/presentation/cubits/base/base_cubit.dart';
import 'package:newsd/core/resources/data_state.dart';

part 'news_state.dart';

class NewsCubit extends BaseCubit<NewsState, List<Article>> {
  final ApiRepository _apiRepository;

  NewsCubit(this._apiRepository) : super(const NewsLoading(), []);

  Future<void> getNews({String? category}) async {
    if (isBusy) return;
    emit(NewsLoading());

    final response = await _apiRepository.getNews(
      request: category != null ? NewsRequest(q: category) : NewsRequest(),
    );

    if (response is DataSuccess) {
      final articles = response.data!.articles;

      data.clear();
      data.addAll(articles);

      emit(NewsSuccess(
        articles: data,
      ));
    } else if (response is DataFailed) {
      emit(NewsFailed(
        error: response.error,
      ));
    }
  }
}
