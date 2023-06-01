import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:newsd/src/domain/models/article.dart';
import 'package:newsd/src/presentation/views/home_page.dart';
import 'package:newsd/src/presentation/views/news_detail_page.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  routes: [
    AutoRoute(
      page: HomePage,
      initial: true,
    ),
    AutoRoute(
      page: NewsDetailPage,
    )
  ],
)
class AppRouter extends _$AppRouter {}

final appRouter = AppRouter();
