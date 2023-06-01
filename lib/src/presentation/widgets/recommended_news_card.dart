import 'package:flutter/material.dart';
import 'package:newsd/src/config/colors.dart';
import 'package:newsd/src/config/router/app_router.dart';
import 'package:newsd/src/domain/models/article.dart';

class RecommendedNewsCard extends StatelessWidget {
  final Article article;

  const RecommendedNewsCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => appRouter.push(NewsDetailPageRoute(article: article)),
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
                    style: const TextStyle(
                      color: AppColors.grey78,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      fontSize: 10,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      article.title ?? '',
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Text(
                    article.publishedAt ?? '',
                    style: const TextStyle(
                      color: AppColors.grey78,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      fontSize: 10,
                    ),
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
