// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:newsd/src/domain/models/article.dart';

class BreakingNewsResponse extends Equatable {
  final String status;
  final int totalResults;
  final List<Article> articles;

  const BreakingNewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  BreakingNewsResponse copyWith({
    String? status,
    int? totalResults,
    List<Article>? articles,
  }) {
    return BreakingNewsResponse(
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

  factory BreakingNewsResponse.fromMap(Map<String, dynamic> map) {
    return BreakingNewsResponse(
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

  factory BreakingNewsResponse.fromJson(String source) =>
      BreakingNewsResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [status, totalResults, articles];
}
