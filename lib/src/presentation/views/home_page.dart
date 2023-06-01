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
        title: const Text(
          'Newsd',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 16,
                bottom: 10,
                left: 16,
                right: 16,
              ),
              child: Text('Breaking News',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 16)),
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
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        current = index;
                        newsCubit.getNews(category: tabItems[index]);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: current == index
                            ? AppColors.blue
                            : AppColors.greyE6,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Center(
                          child: Text(
                            tabItems[index],
                            style: TextStyle(
                              color: current == index
                                  ? Colors.white
                                  : AppColors.grey78,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 8);
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Recommended for you',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
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
