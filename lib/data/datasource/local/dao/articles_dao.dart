import 'package:floor/floor.dart';
import 'package:newsd/domain/models/article.dart';
import 'package:newsd/core/constants/strings.dart';

@dao
abstract class ArticleDao {
  @Query('SELECT * FROM $articlesTableName')
  Future<List<Article>> getAllArticles();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertArticle(Article article);

  @Query('DELETE FROM $articlesTableName WHERE title=:title')
  Future<void> deleteArticle(String title);
}
