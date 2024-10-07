import 'package:flutter/cupertino.dart';
import 'package:newsd/presentation/cubits/local_articles/local_articles_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsd/presentation/widgets/articles_list.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalArticlesCubit, LocalArticlesState>(
      builder: (_, state) {
        switch (state.runtimeType) {
          case LocalArticlesLoading:
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          case LocalArticlesSuccess:
            {
              if (state.articles.isEmpty) {
                return const Center(
                  child: Text('NO SAVED ARTICLES'),
                );
              } else {
                return Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    ArticlesList(articles: state.articles),
                  ],
                );
              }
            }
          default:
            return const SizedBox();
        }
      },
    );
  }
}
