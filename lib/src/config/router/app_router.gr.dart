// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomePageRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    NewsDetailPageRoute.name: (routeData) {
      final args = routeData.argsAs<NewsDetailPageRouteArgs>();
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: NewsDetailPage(
          key: args.key,
          article: args.article,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          HomePageRoute.name,
          path: '/',
        ),
        RouteConfig(
          NewsDetailPageRoute.name,
          path: '/news-detail-page',
        ),
      ];
}

/// generated route for
/// [HomePage]
class HomePageRoute extends PageRouteInfo<void> {
  const HomePageRoute()
      : super(
          HomePageRoute.name,
          path: '/',
        );

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [NewsDetailPage]
class NewsDetailPageRoute extends PageRouteInfo<NewsDetailPageRouteArgs> {
  NewsDetailPageRoute({
    Key? key,
    required Article article,
  }) : super(
          NewsDetailPageRoute.name,
          path: '/news-detail-page',
          args: NewsDetailPageRouteArgs(
            key: key,
            article: article,
          ),
        );

  static const String name = 'NewsDetailPageRoute';
}

class NewsDetailPageRouteArgs {
  const NewsDetailPageRouteArgs({
    this.key,
    required this.article,
  });

  final Key? key;

  final Article article;

  @override
  String toString() {
    return 'NewsDetailPageRouteArgs{key: $key, article: $article}';
  }
}
