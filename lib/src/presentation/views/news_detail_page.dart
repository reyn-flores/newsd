import 'package:flutter/material.dart';
import 'package:newsd/src/config/colors.dart';
import 'package:newsd/src/config/router/app_router.dart';
import 'package:newsd/src/domain/models/article.dart';

class NewsDetailPage extends StatelessWidget {
  final Article article;
  const NewsDetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
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
              // todo
            },
            icon: const Icon(
              Icons.bookmark_border_rounded,
              color: Colors.black,
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
                    style: const TextStyle(
                        color: AppColors.grey78,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w300,
                        fontSize: 14),
                  ),
                  const Text(
                    ' • ',
                    style: TextStyle(
                        color: AppColors.blue,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w300,
                        fontSize: 14),
                  ),
                  Text(article.publishedAt ?? '',
                      style: const TextStyle(
                          color: AppColors.grey78,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                          fontSize: 14)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                article.title ?? '',
                style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
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
                style: const TextStyle(
                    color: AppColors.grey78,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
