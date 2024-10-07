import 'package:flutter/material.dart';
import 'package:newsd/app.dart';
import 'package:newsd/core/app_router/app_router.dart';
import 'package:newsd/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  final appRouter = AppRouter(
    navigatorKey: GlobalKey<NavigatorState>(),
  );

  runApp(App(
    appRouter: appRouter,
  ));
}
