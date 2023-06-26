import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsd/src/config/router/app_router.dart';
import 'package:newsd/src/config/themes/app_themes.dart';
import 'package:newsd/src/domain/repositories/api_repository.dart';
import 'package:newsd/src/domain/repositories/database_repository.dart';
import 'package:newsd/src/locator.dart';
import 'package:newsd/src/presentation/cubits/breaking_news/breaking_news_cubit.dart';
import 'package:newsd/src/presentation/cubits/local_articles/local_articles_cubit.dart';
import 'package:newsd/src/presentation/cubits/news/news_cubit.dart';
import 'package:newsd/src/utils/constants/strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit(
            locator<ApiRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => BreakingNewsCubit(
            locator<ApiRepository>(),
          )..getBreakingNews(),
        ),
        BlocProvider(
          create: (context) => LocalArticlesCubit(
            locator<DatabaseRepository>(),
          )..getAllSavedArticles(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
        title: appTitle,
        theme: AppTheme.light,
      ),
    );
  }
}
