import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/models/article.dart';
import '../../../domain/repositories/database_repository.dart';

part 'local_articles_state.dart';

class LocalArticlesCubit extends Cubit<LocalArticlesState> {
  final DatabaseRepository _databaseRepository;

  LocalArticlesCubit(this._databaseRepository)
      : super(const LocalArticlesLoading());

  Future<void> getAllSavedArticles() async {
    emit(await _getAllSavedArticles());
  }

  Future<void> removeArticle({required String title}) async {
    await _databaseRepository.removeArticle(title);
    emit(await _getAllSavedArticles());
  }

  Future<void> saveArticle({required Article article}) async {
    await _databaseRepository.saveArticle(article);
    emit(await _getAllSavedArticles());
  }

  Future<LocalArticlesState> _getAllSavedArticles() async {
    final articles = await _databaseRepository.getSavedArticles();
    _favorites = articles;
    return LocalArticlesSuccess(articles: articles);
  }

  List<Article> _favorites = [];
  List<Article> get favorites => _favorites;
}
