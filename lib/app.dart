import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:newsd/core/app_router/app_router.dart';
import 'package:newsd/core/themes/app_themes.dart';
import 'package:newsd/domain/repositories/api_repository.dart';
import 'package:newsd/domain/repositories/database_repository.dart';
import 'package:newsd/injector.dart';
import 'package:newsd/presentation/cubits/breaking_news/breaking_news_cubit.dart';
import 'package:newsd/presentation/cubits/local_articles/local_articles_cubit.dart';
import 'package:newsd/presentation/cubits/news/news_cubit.dart';
import 'package:newsd/core/constants/strings.dart';

class App extends StatelessWidget {
  const App({super.key, required appRouter}) : _appRouter = appRouter;

  final AppRouter _appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit(
            getIt<ApiRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => BreakingNewsCubit(
            getIt<ApiRepository>(),
          )..getBreakingNews(),
        ),
        BlocProvider(
          create: (context) => LocalArticlesCubit(
            getIt<DatabaseRepository>(),
          )..getAllSavedArticles(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _appRouter.routes,
        title: appTitle,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en'),
        ],
        theme: AppTheme.light,
      ),
    );
  }
}
