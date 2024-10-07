import 'package:flutter/material.dart';
import 'package:newsd/core/app_router/app_router.dart';
import 'package:newsd/core/extensions.dart';
import 'package:newsd/domain/models/article.dart';

class BreakingNewsCard extends StatelessWidget {
  final Article article;

  const BreakingNewsCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.go(Routes.newsDetails, extra: article),
      child: SizedBox(
        width: 300,
        height: 180,
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(article.urlToImage ?? ""),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(15),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black],
                    )),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.source?.name ?? "",
                      maxLines: 1,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(color: Colors.white),
                    ),
                    Text(
                      article.title ?? "",
                      maxLines: 3,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
