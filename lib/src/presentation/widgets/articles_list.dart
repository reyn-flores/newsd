import 'package:flutter/material.dart';
import 'package:newsd/src/domain/models/article.dart';
import 'package:newsd/src/presentation/widgets/recommended_news_card.dart';

class ArticlesList extends StatelessWidget {
  final List<Article> articles;

  const ArticlesList({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 16,
      ),
      shrinkWrap: true,
      primary: false,
      scrollDirection: Axis.vertical,
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return RecommendedNewsCard(
          article: articles[index],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 8,
        );
      },
    );
  }
}
