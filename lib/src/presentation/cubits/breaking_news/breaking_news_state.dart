part of 'breaking_news_cubit.dart';

abstract class BreakingNewsState extends Equatable {
  final List<Article> articles;
  final DioError? error;

  const BreakingNewsState({
    this.articles = const [],
    this.error,
  });

  @override
  List<Object?> get props => [
        articles,
        error,
      ];
}

class BreakingNewsLoading extends BreakingNewsState {
  const BreakingNewsLoading();
}

class BreakingNewsSuccess extends BreakingNewsState {
  const BreakingNewsSuccess({super.articles});
}

class BreakingNewsFailed extends BreakingNewsState {
  const BreakingNewsFailed({super.error});
}
