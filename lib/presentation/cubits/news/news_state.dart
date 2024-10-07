part of 'news_cubit.dart';

abstract class NewsState extends Equatable {
  final List<Article> articles;
  final DioError? error;

  const NewsState({
    this.articles = const [],
    this.error,
  });

  @override
  List<Object?> get props => [
        articles,
        error,
      ];
}

class NewsLoading extends NewsState {
  const NewsLoading();
}

class NewsSuccess extends NewsState {
  const NewsSuccess({
    super.articles,
  });
}

class NewsFailed extends NewsState {
  const NewsFailed({
    super.error,
  });
}
