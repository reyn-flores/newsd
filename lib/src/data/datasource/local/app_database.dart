import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:newsd/src/data/datasource/local/converters/source_type_converters.dart';
import 'package:newsd/src/data/datasource/local/dao/articles_dao.dart';
import 'package:newsd/src/domain/models/article.dart';

part 'app_database.g.dart';

@TypeConverters([SourceTypeConverter])
@Database(version: 1, entities: [Article])
abstract class AppDatabase extends FloorDatabase {
  ArticleDao get articleDao;
}
