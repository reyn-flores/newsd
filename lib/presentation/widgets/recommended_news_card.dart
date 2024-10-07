import 'package:flutter/material.dart';
import 'package:newsd/core/app_router/app_router.dart';
import 'package:newsd/core/colors.dart';
import 'package:newsd/core/extensions.dart';
import 'package:newsd/domain/models/article.dart';

class RecommendedNewsCard extends StatelessWidget {
  final Article article;

  const RecommendedNewsCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.go(Routes.newsDetails, extra: article),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(article.urlToImage ?? ''),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.source?.name ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: AppColors.grey78),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      article.title ?? '',
                      maxLines: 2,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  Text(
                    article.publishedAt ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: AppColors.grey78),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
