import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:predict_age_client/utils/logger.dart';

import 'router/app_router.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});
  static final GoRouter appRouter = AppRouter().router();
  static GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  void initState() {
    super.initState();
    LogService.init(usePrettyPrinter: true);
    ElevarmFontFamilies.init();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scaffoldMessengerKey: App.scaffoldMessengerKey,
      title: 'Fadli',
      routeInformationProvider: App.appRouter.routeInformationProvider,
      routeInformationParser: App.appRouter.routeInformationParser,
      routerDelegate: App.appRouter.routerDelegate,
      debugShowCheckedModeBanner: false,
    );
  }
}
