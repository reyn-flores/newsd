import 'package:newsd/src/data/datasource/local/app_database.dart';

import '../../domain/models/article.dart';
import '../../domain/repositories/database_repository.dart';

class DatabaseRepositoryImpl implements DatabaseRepository {
  final AppDatabase _appDatabase;

  DatabaseRepositoryImpl(this._appDatabase);

  @override
  Future<List<Article>> getSavedArticles() async {
    return _appDatabase.articleDao.getAllArticles();
  }

  @override
  Future<void> removeArticle(String title) async {
    return _appDatabase.articleDao.deleteArticle(title);
  }

  @override
  Future<void> saveArticle(Article article) async {
    return _appDatabase.articleDao.insertArticle(article);
  }
}
