import 'package:flutter/material.dart';
import 'package:newsd/src/config/colors.dart';
import 'package:newsd/src/config/router/app_router.dart';
import 'package:newsd/src/domain/models/article.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsd/src/presentation/cubits/local_articles/local_articles_cubit.dart';

class NewsDetailPage extends StatelessWidget {
  final Article article;
  const NewsDetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final localArticlesCubit =
        BlocProvider.of<LocalArticlesCubit>(context, listen: true);
    var isFavorite = false;
    if (localArticlesCubit.favorites
        .any((item) => item.title == article.title)) {
      isFavorite = true;
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => appRouter.pop(),
          icon: const Icon(
            Icons.chevron_left_rounded,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              localArticlesCubit.saveArticle(article: article);
            },
            icon: Icon(
              isFavorite ? Icons.bookmark : Icons.bookmark_border_rounded,
              color: isFavorite ? AppColors.blue : Colors.black,
            ),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // todo
        },
        backgroundColor: AppColors.blue,
        child: const Icon(
          Icons.keyboard_double_arrow_up_rounded,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    article.source?.name ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: AppColors.grey78),
                  ),
                  Text(
                    ' • ',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: AppColors.blue),
                  ),
                  Text(
                    article.publishedAt ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: AppColors.grey78),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                article.title ?? '',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(article.urlToImage ?? ""),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                article.content ?? '',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: AppColors.grey78),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
