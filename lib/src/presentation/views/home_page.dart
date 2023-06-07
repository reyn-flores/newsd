import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsd/src/config/colors.dart';
import 'package:newsd/src/presentation/cubits/breaking_news/breaking_news_cubit.dart';
import 'package:newsd/src/presentation/cubits/news/news_cubit.dart';
import 'package:newsd/src/presentation/widgets/breaking_news_card.dart';
import 'package:newsd/src/presentation/widgets/recommended_news_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> tabItems = [
    'All',
    'Politics',
    'Educations',
    'Sports',
    'Games',
  ];
  int current = 0;

  @override
  Widget build(BuildContext context) {
    final newsCubit = BlocProvider.of<NewsCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Newsd',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 16,
                bottom: 10,
                left: 16,
                right: 16,
              ),
              child: Text(
                'Breaking News',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            SizedBox(
              height: 180,
              child: BlocBuilder<BreakingNewsCubit, BreakingNewsState>(
                builder: (context, state) {
                  switch (state.runtimeType) {
                    case BreakingNewsLoading:
                      return const Center(
                        child: CupertinoActivityIndicator(),
                      );
                    case BreakingNewsSuccess:
                      return ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.articles.length,
                        itemBuilder: (context, index) {
                          return BreakingNewsCard(
                              article: state.articles[index]);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: 8,
                          );
                        },
                      );
                    case BreakingNewsFailed:
                      return const Center(
                        child: Text('API FETCH FAILED!'),
                      );
                    default:
                      return const SizedBox();
                  }
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 30,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: tabItems.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return TextButton(
                    onPressed: () {
                      setState(() {
                        current = index;
                        newsCubit.getNews(category: tabItems[index]);
                      });
                    },
                    style: TextButton.styleFrom(
                      backgroundColor:
                          current == index ? AppColors.blue : AppColors.greyE6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                    ),
                    child: Text(
                      tabItems[index],
                      style: TextStyle(
                        color:
                            current == index ? Colors.white : AppColors.grey78,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 8);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Recommended for you',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            BlocBuilder<NewsCubit, NewsState>(
              builder: (context, state) {
                switch (state.runtimeType) {
                  case NewsLoading:
                    return const Center(
                      child: CupertinoActivityIndicator(),
                    );
                  case NewsSuccess:
                    return ListView.separated(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        bottom: 16,
                      ),
                      shrinkWrap: true,
                      primary: false,
                      scrollDirection: Axis.vertical,
                      itemCount: state.articles.length,
                      itemBuilder: (context, index) {
                        return RecommendedNewsCard(
                          article: state.articles[index],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 8,
                        );
                      },
                    );
                  case NewsFailed:
                    return const Center(
                      child: Text('API FETCH FAILED!'),
                    );
                  default:
                    return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
