import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newsd/domain/models/article.dart';
import 'package:newsd/presentation/views/home_page.dart';
import 'package:newsd/presentation/views/news_detail_page.dart';

class AppRouter {
  AppRouter({
    required GlobalKey<NavigatorState> navigatorKey,
  }) {
    _goRouter = _routes(navigatorKey);
  }
  late final GoRouter _goRouter;

  GoRouter get routes => _goRouter;

  GoRouter _routes(
    GlobalKey<NavigatorState> navigatorKey,
  ) {
    return GoRouter(
      navigatorKey: navigatorKey,
      routes: [
        GoRoute(
          name: Routes.initial,
          path: Routes.initial,
          builder: (context, state) => HomePage(),
          routes: [
            GoRoute(
              name: Routes.newsDetails,
              path: Routes.newsDetails,
              builder: (context, state) =>
                  NewsDetailPage(article: state.extra as Article),
            ),
          ],
        ),
      ],
    );
  }
}

class Routes {
  static const initial = '/';
  static const newsDetails = '/news-details';
}
