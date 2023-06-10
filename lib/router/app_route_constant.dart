enum AppRoute { mainScren, predictScreen }

extension AppRouteExtension on AppRoute {
  String get name {
    switch (this) {
      case AppRoute.mainScren:
        return 'Main Screen';
      case AppRoute.predictScreen:
        return 'Predict Screen';
    }
  }

  String get path {
    switch (this) {
      case AppRoute.mainScren:
        return '/';
      case AppRoute.predictScreen:
        return '/predict';
    }
  }
}
