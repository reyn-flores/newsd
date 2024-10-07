import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:newsd/domain/models/article.dart';

class NewsResponse extends Equatable {
  final String status;
  final int totalResults;
  final List<Article> articles;

  const NewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  NewsResponse copyWith({
    String? status,
    int? totalResults,
    List<Article>? articles,
  }) {
    return NewsResponse(
      status: status ?? this.status,
      totalResults: totalResults ?? this.totalResults,
      articles: articles ?? this.articles,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'totalResults': totalResults,
      'articles': articles.map((x) => x.toMap()).toList(),
    };
  }

  factory NewsResponse.fromMap(Map<String, dynamic> map) {
    return NewsResponse(
      status: map['status'] as String,
      totalResults: map['totalResults'] as int,
      articles: List<Article>.from(
        map['articles'].map<Article>(
          (x) => Article.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsResponse.fromJson(String source) =>
      NewsResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [status, totalResults, articles];
}
