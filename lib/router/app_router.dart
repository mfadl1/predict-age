import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:predict_age_client/predict_screen.dart';

import '../landing_screen.dart';
import '../main_screen.dart';
import 'app_route_constant.dart';
import 'route_observer.dart';

class AppRouter {
  AppRouter();

  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  GoRouter router() => GoRouter(
        navigatorKey: _rootNavigatorKey,
        debugLogDiagnostics: true,
        observers: [
          AppRouteObserver(),
        ],
        routes: <RouteBase>[
          GoRoute(
            path: AppRoute.mainScren.path,
            name: AppRoute.mainScren.name,
            builder: (context, state) => MainScreen(
              body: const LandingScreen(),
            ),
          ),
          GoRoute(
            path: AppRoute.predictScreen.path,
            name: AppRoute.predictScreen.name,
            builder: (context, state) => MainScreen(
              body: const PredictScreen(),
            ),
          ),
        ],
      );
}
